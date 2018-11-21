#!/bin/sh

set -eu

cd "${GITHUB_WORKSPACE}/${GITBOOK_FOLDER:-.}"

GITBOOK_FILE_PATH="${GITBOOK_FOLDER:-.}/${GITBOOK_NAME:-book}.pdf"

HAS_PDF_COMMIT=$(cat "${GITHUB_EVENT_PATH}" | jq .commits[0].added[0] | tr -d '"')

if [ "./${HAS_PDF_COMMIT}" == "${GITBOOK_FILE_PATH}" ]; then
  echo "==> skipping…"
  exit 0;
fi

gitbook install

echo
echo "==> Generating ${GITBOOK_FILE_PATH}…"
gitbook pdf ./ ${GITBOOK_FILE_PATH}
echo "Done."
echo

cd "${GITHUB_WORKSPACE}"

GIT_NAME=$(cat "${GITHUB_EVENT_PATH}" | jq .pusher.name | tr -d '"')
GIT_EMAIL=$(cat "${GITHUB_EVENT_PATH}" | jq .pusher.email | tr -d '"')

git config user.name "${GIT_NAME}"
git config user.email "${GIT_EMAIL}"

git status	# debug

git add "${GITBOOK_FILE_PATH}"

git status	# debug

# git commit -m "Add ${GITBOOK_FILE_PATH}"
#
# git status	# debug
#
# # git push
