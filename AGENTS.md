# Repository Guidelines

## Project Structure & Module Organization
- `zsh/.zshenv` and `.zshrc` handle environment detection, plugin loading, and history; edit detection helpers in place instead of scattering conditionals.
- `zsh/functions/` contains one autoloaded function per file with `##?` docs; keep names lowercase with underscores.
- `zsh/plugins/` houses modular features with optional `functions/` and `config/` folders; update `.zplugins` when wiring new modules.
- `git/` stores shared Git defaults and templates, while `docs/` plus `mkdocs.yml` serve install guides and assets under `docs/templates/`.

## Build, Test, and Development Commands
- `fnreload [path]` reloads autoloaded functions after edits without restarting the shell.
- `rm ~/.dot/zsh/.zplugins.zsh && exec zsh` (or `antidote bundle`) rebuilds the plugin cache whenever `.zplugins` or plugin sources change.
- `mkdocs serve -f mkdocs.yml` previews docs at `http://127.0.0.1:8000`; `mkdocs build` confirms navigation before publishing.
- `zsh -n <file>` and `shellcheck -s bash <file>` surface syntax issues even though ZSH is the runtime.

## Coding Style & Naming Conventions
- Start scripts with `#!/usr/bin/env zsh`, use spaces (4-wide) for indentation, and avoid tabs.
- Functions should stay lowercase snake_case, accept short positional args, guard state with `local`, and return explicit exit codes.
- Document user-facing helpers with `##?` usage lines; plugins end in `.plugin.zsh`, helper files mirror the callable name, and themes retain upstream suffixes.

## Testing Guidelines
- Source updated files in a fresh shell (`exec zsh` or `source <file>`) and exercise OS branches by temporarily exporting detector vars (e.g., `DOT_HOST`).
- Validate docs with the MkDocs commands above; flag missing platform coverage or manual steps directly in your PR.
- Optional: run `shellcheck` or plugin-specific verification scripts when available and note any skipped checks.

## Commit & Pull Request Guidelines
- Follow the repository's Conventional Commit pattern (`type: detail`); split docs, shell tweaks, and git config updates into focused commits.
- PR descriptions should call out affected platforms, manual verification, and follow-up work; attach terminal snippets or screenshots when clarifying behavior.
- Link upstream issues or plugin releases when syncing external resources and highlight breaking changes early in the description.

## Security & Configuration Tips
- Keep secrets in `.env` or host-specific overrides; commit only sanitized examples such as `.env.example` and `docs/templates/`.
- Gate machine-specific logic with the provided detector helpers to avoid breaking other setups.
- Verify third-party scripts with checksums before bundling and document new dependencies in the relevant OS guide.
