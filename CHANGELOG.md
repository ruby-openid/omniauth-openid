# Changelog

This file documents all notable changes to this project since v2.0.2.

The format is based on [Keep a Changelog v1](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning v2](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

## [2.0.2] - 2025-06-08
- TAG: [v2.0.2][2.0.2t]
- COVERAGE: 92.06% -- 348/378 lines in 15 files
- BRANCH COVERAGE: 79.49% -- 62/78 branches in 15 files
- 44.44% documented
### Added
- Github Actions for Continuous Integration by @pboling
  - Test workflows with latest dependencies and more platform and dep HEADs
  - Expanded test suite, covering many more points of the dependency matrix
- More documentation by @pboling
- 20 year signing cert expires 2045-04-29 by @pboling
- Added CITATION.cff by @pboling
- devcontainer for easier maintenance by @pboling
- Add SECURITY.md policy by @pboling
- CONTRIBUTING.md - Instructions for contributing by @pboling
- Modernized gem structure, and updated dependencies for development by @pboling
- Set `SKIP_GEM_SIGNING` in env to allow `gem build` without cryptographic signing requirement by @pboling
  - Useful for linux distros whose package managers sign packages independently
### Changed
- Updated Code of Conduct to Contributor Covenant v2.1 by @pboling

## [2.0.1] - 2021-01-19
- TAG: [v2.0.0][2.0.0t]

## [1.0.1] - 2011-11-04
- TAG: [v1.0.1][1.0.1t]

## [1.0.0] - 2011-11-02
- TAG: [v1.0.][1.0.0t]

[Unreleased]: https://github.com/omniauth/omniauth-openid/compare/v2.0.2...HEAD
[2.0.2]: https://github.com/omniauth/omniauth-openid/compare/v2.0.2...v2.0.1
[2.0.2t]: https://github.com/omniauth/omniauth-openid/tags/v2.0.2
[2.0.1]: https://github.com/omniauth/omniauth-openid/compare/v2.0.1...v1.0.1
[2.0.1t]: https://github.com/omniauth/omniauth-openid/tags/v2.0.1
[1.0.1]: https://github.com/omniauth/omniauth-openid/compare/v1.0.1...v1.0.0
[1.0.1t]: https://github.com/omniauth/omniauth-openid/tags/v1.0.1
[1.0.0]: https://github.com/omniauth/omniauth-openid/compare/6019f3abd7b707567e2217c91be64f7a6c4aa34b...v1.0.0
[1.0.0t]: https://github.com/omniauth/omniauth-openid/tags/v1.0.0
