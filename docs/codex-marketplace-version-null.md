# Codex Marketplace Version Null

## Summary

On Codex CLI `0.141.0`, `codex plugin list --available --json` can report `"version": null` for a local marketplace entry before install, even when the marketplace entry includes a version and the plugin manifest has a version.

The install path still resolves the package version correctly from `.codex-plugin/plugin.json`.

## Reproduction

```bash
tmp="$(mktemp -d)"
CODEX_HOME="$tmp" codex plugin marketplace add . --json
CODEX_HOME="$tmp" codex plugin list --available --json
CODEX_HOME="$tmp" codex plugin add startup-ideation-skills@startup-ideation-skills --json
rm -rf "$tmp"
```

Observed before install:

```json
{
  "name": "startup-ideation-skills",
  "version": null,
  "source": {
    "source": "git",
    "url": "https://github.com/forjd/startup-ideation-skills.git",
    "ref": "v0.2.0"
  }
}
```

Observed after install:

```json
{
  "name": "startup-ideation-skills",
  "version": "0.2.0"
}
```

## Comparison

A local Story Skills marketplace entry in the Codex plugin cache showed the same available-list behavior: `version` was `null` before install even though its `.codex-plugin/plugin.json` declared a package version.

## Current repo policy

- Keep `version` in `.codex-plugin/plugin.json`.
- Mirror that version into `.agents/plugins/marketplace.json`.
- Pin marketplace `source.ref` to the matching release tag.
- Validate the mirrored metadata with `script/validate`.

If Codex changes the available-list schema or starts reading a different marketplace field for pre-install versions, update `.agents/plugins/marketplace.json` and `script/validate_skills.rb` together.
