#!/usr/bin/env bash

set -e

cd "${0%/*}/../../.."

bundle exec brakeman --exit-on-warn --no-summary
