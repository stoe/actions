#!/bin/sh

set -eu

cd "${GITHUB_WORKSPACE}/${GITBOOK_FOLDER:-.}"

GITBOOK_PDF_NAME="${GITBOOK_NAME:-book}.pdf"
GITBOOK_FILE_PATH="${GITBOOK_FOLDER:-.}/${GITBOOK_PDF_NAME}"

HAS_PDF_COMMIT=$(cat "${GITHUB_EVENT_PATH}" | jq .commits[0].added[0] | tr -d '"')

if [ "${HAS_PDF_COMMIT}" == "${GITBOOK_FILE_PATH}" ]; then
  echo "==> skipping…"
  exit 0;
fi

gitbook install

echo
echo "==> Generating ${GITBOOK_FILE_PATH}…"
gitbook pdf ./ ${GITBOOK_PDF_NAME}
echo "Done."
echo

GIT_NAME=$(cat "${GITHUB_EVENT_PATH}" | jq .pusher.name | tr -d '"')
GIT_EMAIL=$(cat "${GITHUB_EVENT_PATH}" | jq .pusher.email | tr -d '"')

git config user.name "${GIT_NAME}"
git config user.email "${GIT_EMAIL}"

git add "${GITBOOK_PDF_NAME}"
git commit -m "Add ${GITBOOK_PDF_NAME}"

git push
