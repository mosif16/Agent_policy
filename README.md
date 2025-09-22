# Agent Policy Sync

This repository stores a canonical `AGENTS.md` policy and supporting notes for Builder-mode agents. The content is safe to share publicly; any local operational data stays outside the repo.

## Repository Layout
- `AGENTS.md` – canonical agent directives distributed to dependent projects.
- `docs/` – extended playbooks and background material (`AGENTS_full.md`).
- `ios/` – iOS-specific copies that pick up the canonical policy when synchronized.
- `Handoff.md` – timestamped work log that tracks in-progress tasks, blockers, and next actions.

## Sync Scripts

### Public CLI (`scripts/sync-agents.sh`)
The repository ships with a portable sync tool that reads user-defined destinations at runtime:

```shell
scripts/sync-agents.sh [--apply] [--src /path/to/AGENTS.md] \
  [--target /absolute/path]... [--targets-file targets.txt]
```

- Dry run is the default; only reports which targets differ.
- Provide `--apply` to overwrite targets after first creating timestamped backups.
- Supply paths with repeated `--target` flags or via a newline-delimited file. See `targets.example.txt` for a template (blank lines and `#` comments are ignored).
- Use `--src` to test draft policies without touching the canonical `AGENTS.md`.

If the script prints "Backup failed" on macOS, grant the terminal Full Disk Access or manage those files manually; the backup step preserves originals before writing.

### Local-only helper (`agents-sync.zsh`)
For personal automation, the untracked `agents-sync.zsh` script can stay next to this repo and mirror additional machine-specific paths. Because it contains absolute paths, keep it outside version control and rely on the public CLI for shareable workflows.

## Contributing
- Update `AGENTS.md` or the supporting docs directly and document the change in `Handoff.md`.
- Keep local scripts and any machine-specific tooling out of version control.
