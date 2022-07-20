#!/usr/bin/env bash
MIN_COVERAGE="95"

GREEN="\e[32;1m%s\e[0m\n"
RED="\e[31;1m%s\e[0m\n"
BLUE="\e[36;1m%s\e[0m\n"

if ! melos run test_cov; then
    exit 1
fi

melos run union_cov

printf "${BLUE}" "Checking minimum code coverage..."

printf "${GREEN}" "Minimum coverage required: ${MIN_COVERAGE}%"
CODE_COVERAGE=$(lcov -q --list coverage/lcov.info | sed -n "s/.*Total:|\([^%]*\)%.*/\1/p")

if (($(echo "$CODE_COVERAGE < $MIN_COVERAGE" | bc))); then
    printf "${RED}" "Current code coverage: ${CODE_COVERAGE}%"
    exit 1
fi

printf "${GREEN}" "Current code coverage: ${CODE_COVERAGE}%"

# pass first argument equal to false to avoid generating the report
if ! $1; then
    exit
fi

genhtml coverage/lcov.info -o coverage/report