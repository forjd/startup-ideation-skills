#!/usr/bin/env ruby
# frozen_string_literal: true

require "pathname"
require "set"
require "yaml"

ROOT = Pathname.new(__dir__).parent
REGRESSION_FILE = ROOT.join("tests/prompt_regressions.yml")

def fail!(message)
  warn "Prompt regression validation failed: #{message}"
  exit 1
end

data = YAML.safe_load(REGRESSION_FILE.read)
scenarios = data.fetch("scenarios")
fail!("scenarios must be a non-empty array") unless scenarios.is_a?(Array) && !scenarios.empty?

seen_ids = Set.new

scenarios.each do |scenario|
  id = scenario["id"]
  fail!("scenario missing id") unless id.is_a?(String) && !id.empty?
  fail!("duplicate scenario id #{id}") unless seen_ids.add?(id)

  skill = scenario["skill"]
  prompt = scenario["prompt"]
  fail!("#{id}: missing skill") unless skill.is_a?(String) && !skill.empty?
  fail!("#{id}: missing prompt") unless prompt.is_a?(String) && !prompt.empty?

  skill_file = ROOT.join("skills", skill, "SKILL.md")
  fail!("#{id}: skill does not exist: #{skill}") unless skill_file.file?

  expected = scenario["expected_properties"]
  fail!("#{id}: missing expected_properties") unless expected.is_a?(Hash) && !expected.empty?
  expected.each do |property, values|
    fail!("#{id}: expected property #{property} must be a non-empty list") unless values.is_a?(Array) && values.all? { |value| value.is_a?(String) && !value.empty? }
  end

  markers = scenario["instruction_markers"]
  fail!("#{id}: missing instruction_markers") unless markers.is_a?(Array) && !markers.empty?

  skill_text = skill_file.read
  markers.each do |marker|
    fail!("#{id}: instruction marker not found in #{skill_file.relative_path_from(ROOT)}: #{marker}") unless skill_text.include?(marker)
  end
end

puts "Validated #{scenarios.length} prompt regression scenarios"
