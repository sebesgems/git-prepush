#!/usr/bin/env bash

set -e

cd "${0%/*}/../../.."

bundle exec rails test
