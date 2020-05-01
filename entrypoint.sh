#!/bin/bash
set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

# 1. First check for warnings, should not exit with fail code when warnings found
# shellcheck disable=SC2086
dub lint ${INPUT_DUB_FLAGS} --root="${INPUT_PATH:-PWD}" -- ${INPUT_FLAGS} | reviewdog -efm="%f(%l:%c)[%tarn]: %m" -name="dscanner" -reporter="${INPUT_REPORTER}" -level="${INPUT_LEVEL}"

# 2. Then check for errors, if an error is found we should exit in error
set -euox pipefail # i.e: enable strict mode
# shellcheck disable=SC2086
dub lint ${INPUT_DUB_FLAGS} --root="${INPUT_PATH:-PWD}" -- ${INPUT_FLAGS} | reviewdog -efm="%f(%l:%c)[%trror]: %m" -name="dscanner" -reporter="${INPUT_REPORTER}" -level="${INPUT_LEVEL}"
