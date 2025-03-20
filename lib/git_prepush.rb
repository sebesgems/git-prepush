# frozen_string_literal: true

require_relative 'git_prepush/version'
require 'rake'

module GitPrepush
  ROOT = File.dirname __dir__

  load File.expand_path('../lib/tasks/install.rake', __dir__)
end
