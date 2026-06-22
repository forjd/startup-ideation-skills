#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "pathname"
require "set"
require "yaml"

ROOT = Pathname.new(__dir__).parent
ALLOWED_FRONTMATTER_KEYS = Set.new(%w[name description license allowed-tools metadata]).freeze
MAX_SKILL_NAME_LENGTH = 64

def fail!(message)
  warn "Validation failed: #{message}"
  exit 1
end

def read_json(path)
  JSON.parse(path.read)
rescue JSON::ParserError => e
  fail!("invalid JSON in #{path.relative_path_from(ROOT)}: #{e.message}")
end

def frontmatter_for(skill_md)
  content = skill_md.read
  match = content.match(/\A---\n(.*?)\n---\n/m)
  fail!("missing YAML frontmatter in #{skill_md.relative_path_from(ROOT)}") unless match

  YAML.safe_load(match[1])
rescue Psych::SyntaxError => e
  fail!("invalid YAML in #{skill_md.relative_path_from(ROOT)}: #{e.message}")
end

def validate_name!(name, skill_dir)
  fail!("#{skill_dir.basename}: missing name") unless name.is_a?(String) && !name.strip.empty?
  fail!("#{skill_dir.basename}: name must match folder") unless name == skill_dir.basename.to_s
  fail!("#{skill_dir.basename}: name is too long") if name.length > MAX_SKILL_NAME_LENGTH
  fail!("#{skill_dir.basename}: name must be lowercase hyphen-case") unless name.match?(/\A[a-z0-9-]+\z/)
  fail!("#{skill_dir.basename}: name cannot start/end with hyphen or contain consecutive hyphens") if name.start_with?("-") || name.end_with?("-") || name.include?("--")
end

def validate_description!(description, skill_dir)
  fail!("#{skill_dir.basename}: missing description") unless description.is_a?(String) && !description.strip.empty?
  fail!("#{skill_dir.basename}: description is too long") if description.length > 1024
  fail!("#{skill_dir.basename}: description cannot contain angle brackets") if description.include?("<") || description.include?(">")
end

skills_dir = ROOT.join("skills")
skill_dirs = skills_dir.children.select(&:directory?).sort_by { |path| path.basename.to_s }
fail!("no skill directories found") if skill_dirs.empty?

skill_names = Set.new

skill_dirs.each do |skill_dir|
  skill_md = skill_dir.join("SKILL.md")
  fail!("missing #{skill_md.relative_path_from(ROOT)}") unless skill_md.file?

  metadata = frontmatter_for(skill_md)
  fail!("#{skill_md.relative_path_from(ROOT)} frontmatter must be a mapping") unless metadata.is_a?(Hash)

  unexpected_keys = metadata.keys.to_set - ALLOWED_FRONTMATTER_KEYS
  fail!("#{skill_md.relative_path_from(ROOT)} has unexpected frontmatter keys: #{unexpected_keys.to_a.sort.join(", ")}") unless unexpected_keys.empty?

  validate_name!(metadata["name"], skill_dir)
  validate_description!(metadata["description"], skill_dir)
  fail!("duplicate skill name #{metadata["name"]}") if skill_names.include?(metadata["name"])

  skill_names.add(metadata["name"])
end

expected_skill_names = skill_dirs.map { |path| path.basename.to_s }.sort
skills_readme = skills_dir.join("README.md").read
linked_skill_names = skills_readme.scan(/\]\(([^)]+)\/SKILL\.md\)/).flatten.map { |path| File.basename(path) }.sort
fail!("skills/README.md index does not match skill folders") unless linked_skill_names == expected_skill_names

codex_plugin = read_json(ROOT.join(".codex-plugin/plugin.json"))
claude_plugin = read_json(ROOT.join(".claude-plugin/plugin.json"))
codex_marketplace = read_json(ROOT.join(".agents/plugins/marketplace.json"))
claude_marketplace = read_json(ROOT.join(".claude-plugin/marketplace.json"))

codex_version = codex_plugin["version"]
claude_version = claude_plugin["version"]
fail!("package plugin versions must match") unless codex_version == claude_version
fail!("package version must be present") unless codex_version.is_a?(String) && !codex_version.empty?

codex_market_plugin = codex_marketplace.fetch("plugins").fetch(0)
fail!("Codex marketplace version must mirror plugin version") unless codex_market_plugin["version"] == codex_version
fail!("Codex marketplace ref must be release-pinned") unless codex_market_plugin.dig("source", "ref") == "v#{codex_version}"

claude_market_plugin = claude_marketplace.fetch("plugins").fetch(0)
fail!("Claude marketplace version must mirror plugin version") unless claude_market_plugin["version"] == claude_version
fail!("Claude marketplace ref must be release-pinned") unless claude_market_plugin.dig("source", "ref") == "v#{claude_version}"

manifest_skill_names = expected_skill_names
fail!("Codex manifest must point to ./skills/") unless codex_plugin["skills"] == "./skills/"
fail!("Claude manifest must point to ./skills/") unless claude_plugin["skills"] == "./skills/"

puts "Validated #{manifest_skill_names.length} skills and package metadata"
