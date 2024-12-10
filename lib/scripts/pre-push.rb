#!/usr/bin/env ruby

system 'git fetch'

def remote_exists?
  `git rev-parse --abbrev-ref --symbolic-full-name @{u}`.strip
rescue StandardError
  nil
end

def remote_same?
  `git rev-parse HEAD` == `git rev-parse @{u}`
end

def any_checker_failed?
  system("bin/pre-push")
end

return if !remote_exists? || remote_same? 

exit(1) if any_checker_failed?
