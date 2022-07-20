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

## Dependencies

- `Melos` to handle packages;

- `lcov` to generate coverage report;

- Remember to give execute permission on script files.