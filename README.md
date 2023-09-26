# Flutter code coverage mininum analysis with github action

A Flutter project demonstrating how to integrate the repository with github actions.

The `.github/workflows/test_cov.yaml` is prepared to install flutter, configure, run tests and check coverage on every push or pull request.

If you want to block the merge when a test or coverage check fails remember to do the folowing:
- In the desired repository, add a rule in settings/branches;
- Enter the name of the branch that will receive the code (by commit or pull request);
- Check `Require status checks to pass before merging` option;
- Enter the action that is requried to pass in above field.

## How it works?

With the `.github/workflows/test_cov.yaml` correctly configured, github will execute the jobs and steps in the file.

In this case, just one job is configured with some steps to install flutter, configure, execute tests and check coverage.

In order, the `.yaml` file will execute:
- Install Flutter;
- Install lcov (needed to extract information from coverage file);
- Install melos (needed to handle with multi-package app);
- Initalize melos (like a pub get in every package);
- Run `./generate_coverage.sh` script file (responsible for run tests and generate coverage. This script will fail if tests or coverage fails).

## Additional info

This is the third part of four repositories teaching how to handle code coverage in Flutter APPs:

[Part 1 - Flutter code coverage in a single package app](https://github.com/cantellir/flutter_code_coverage_single_package);

[Part 2 - Flutter code coverage in a multi package app](https://github.com/cantellir/flutter_code_coverage_multi_package);

[Part 3 - Github actions to handle Flutter APP minimum coverage](https://github.com/cantellir/flutter_code_coverage_minimum_github_action);

[Part 4 - Integration with Codecov analysis tool](https://github.com/cantellir/flutter_code_coverage_github_codecov);
