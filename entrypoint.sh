#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

dub lint --root="${INPUT_PATH:-PWD}" | reviewdog -efm="%f(%l:%c)[%tarn]: %m" -efm="%f(%l:%c)[%trror]: %m" -name="dscanner" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
