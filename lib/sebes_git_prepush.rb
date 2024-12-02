# frozen_string_literal: true

require_relative 'sebes_git_prepush/version'

module SebesGitPrepush
  ROOT = File.dirname __dir__

  load File.expand_path('tasks/install.rake', __dir__)
end
