#!/usr/bin/env bash

echo "heres"

git fetch

if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]; then
  ./scripts/git/pre-pushs/rubocop.bash
  if [ $? != 0 ]; then
    exit 1
  fi

  ./scripts/git/pre-pushs/brakeman.bash
  if [ $? != 0 ]; then
    exit 1
  fi

  ./scripts/git/pre-pushs/sorbet.bash
  if [ $? != 0 ]; then
    exit 1
  fi

  ./scripts/git/pre-pushs/tests.bash
  if [ $? != 0 ]; then
    exit 1
  fi
fi
