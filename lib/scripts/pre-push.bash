#!/usr/bin/env bash

git fetch

if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]; then
  ./lib/scripts/pre-pushs/rubocop.bash
  if [ $? != 0 ]; then
    exit 1
  fi

  ./lib/scripts/pre-pushs/brakeman.bash
  if [ $? != 0 ]; then
    exit 1
  fi

  ./lib/scripts/pre-pushs/sorbet.bash
  if [ $? != 0 ]; then
    exit 1
  fi

  ./lib/scripts/pre-pushs/tests.bash
  if [ $? != 0 ]; then
    exit 1
  fi
fi
