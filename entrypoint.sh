#!/bin/bash
set -euxo pipefail

if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

if [ -n "${INPUT_PATH}" ]; then
  cd "${INPUT_PATH}" || exit
else
  echo "INPUT_PATH not set"
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

dub lint --quiet | reviewdog -efm="%f(%l:%c)[%tarn]: %m" -efm="%f(%l:%c)[%trror]: %m" -name="dscanner" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
