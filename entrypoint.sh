#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

dub lint --root="${INPUT_PATH:-PWD}" ${INPUT_DUB_FLAGS} -- ${INPUT_FLAGS} | reviewdog -efm="%f(%l:%c)[%tarn]: %m" -efm="%f(%l:%c)[%trror]: %m" -name="dscanner" -reporter="${INPUT_REPORTER}" -level="${INPUT_LEVEL}"
