#!/usr/bin/env ruby

system 'git fetch'

def remote_exist?
  `git rev-parse --abbrev-ref --symbolic-full-name @{u}`.strip
rescue StandardError
  nil
end

def remote_same?
  `git rev-parse HEAD` == `git rev-parse @{u}`
end

return if !remote_exist? || remote_same?

[
  'bundle exec rubocop',
  'srb typecheck',
  'bundle exec brakeman --exit-on-warn --no-summary',
  'bundle exec rails test'
].each do |script|
  break unless system script
end
