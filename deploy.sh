#!/bin/bash

set -o errexit -o nounset

if [ -z "${TRAVIS_BRANCH:-}" ]; then
    echo "This script may only be run from Travis!"
    exit 1
fi

BRANCH=$(if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then echo $TRAVIS_BRANCH; else echo $TRAVIS_PULL_REQUEST_BRANCH; fi)

if [ "$BRANCH" != "master" ]; then
    echo "This commit was made against '$BRANCH' and not master! No deploy!"
    exit 0
fi

# Returns 1 if program is installed and 0 otherwise
program_installed() {
    local return_=1

    type $1 >/dev/null 2>&1 || { local return_=0; }

    echo "$return_"
}

# Ensure required programs are installed
if [ $(program_installed git) == 0 ]; then
    echo "Please install Git."
    exit 1
elif [ $(program_installed mdbook) == 0 ]; then
    echo "Please install mdbook: cargo install mdbook."
    exit 1
fi

echo "Committing book directory to gh-pages branch"
REV=$(git rev-parse --short HEAD)
cd book
git init
git remote add upstream "https://$GH_TOKEN@github.com/rust-lang-nursery/api-guidelines.git"
git config user.name "Rust API Guidelines"
git config user.email "guidelines@rust-lang.org"
git add -A .
git commit -qm "Build guidelines at ${TRAVIS_REPO_SLUG}@${REV}"

echo "Pushing gh-pages to GitHub"
git push -q upstream HEAD:refs/heads/gh-pages --force
