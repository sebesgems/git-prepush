#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Pre-push git hook. Installed by `rake git_prepush:install`.
# Delegates to bin/pre-push when the push has new commits to deliver.

exit 0 if ENV['CI_PREPUSHSKIP'] == '1'

# Git pipes one line per ref to push on stdin:
#   <local_ref> <local_sha> <remote_ref> <remote_sha>
# Skip checks when every ref is either a delete (zero sha) or already at remote.
has_new_commits = $stdin.each_line.any? do |line|
  parts = line.split
  next false if parts.size < 4

  local_sha, remote_sha = parts[1], parts[3]
  !local_sha.match?(/\A0+\z/) && local_sha != remote_sha
end

exit 0 unless has_new_commits

root = `git rev-parse --show-toplevel 2>/dev/null`.strip
Dir.chdir(root) unless root.empty?

exit 1 unless system('bin/pre-push')
