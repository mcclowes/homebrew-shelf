# Shelf Homebrew tap

Install Shelf, an index of your repositories for agents:

```sh
brew install mcclowes/shelf/shelf
shelf --help
```

[Source and documentation](https://github.com/mcclowes/shelf)

The formula installs the versioned release archive and Node.js. Release archives contain compiled JavaScript with no runtime npm dependencies.

## Checks

GitHub Actions checks every push and pull request on Ubuntu 24.04 and macOS 26. It uses stable Homebrew, checks formula style, installs the checksum-pinned release archive through the current checkout's formula, and runs `brew test mcclowes/shelf/shelf`.

The formula test checks the CLI schema and version, scans a temporary demo repository, and generates a skill in temporary storage. It uses an isolated `SHELF_HOME`.

To check an installed copy locally:

```sh
brew test mcclowes/shelf/shelf
```
