#!/bin/sh
set -euxo pipefail

if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

dub lint --quiet | reviewdog -efm="%f(%l:%c)[%tarn]: %m","%f(%l:%c)[%trror]: %m" -name="dscanner" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
