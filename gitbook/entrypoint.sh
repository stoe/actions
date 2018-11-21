#!/bin/sh

set -eu

cd "${GITHUB_WORKSPACE}/${GITBOOK_FOLDER:-.}"

gitbook install 2> /dev/null
gitbook pdf ./ ${GITBOOK_NAME:-book}.pdf

cd "${GITHUB_WORKSPACE}"

GIT_NAME=$("${GITHUB_EVENT_PATH}" | jq .pusher.name)
GIT_EMAIL=$("${GITHUB_EVENT_PATH}" | jq .pusher.email)

git config user.email "${GIT_EMAIL}"
git config user.name "${GIT_NAME}"

git status	# debug

git add "${GITHUB_WORKSPACE}/${GITBOOK_FOLDER:-.}/${GITBOOK_NAME:-book}.pdf"

git status	# debug

git commit -m "Add ${GITBOOK_FOLDER:-.}/${GITBOOK_NAME:-book}.pdf"

git status	# debug

# git push
