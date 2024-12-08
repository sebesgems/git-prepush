#!/usr/bin/env ruby

CHECKERS = [
  'bundle exec rubocop',
  'srb typecheck',
  'bundle exec brakeman --exit-on-warn --no-summary',
  'bundle exec rails test'
].freeze

system 'git fetch'

def remote_exist?
  `git rev-parse --abbrev-ref --symbolic-full-name @{u}`.strip
rescue StandardError
  nil
end

def remote_same?
  `git rev-parse HEAD` == `git rev-parse @{u}`
end

def any_checker_failed?
  CHECKERS.any? { |script| !system(script) }
end

exit 1 if !remote_exist? || remote_same? || any_checker_failed?
