# frozen_string_literal: true

require_relative 'sebes_git_prepush/version'
require 'rake'

module SebesGitPrepush
  ROOT = File.dirname __dir__

  load File.expand_path('tasks/install.rake', __dir__)

  class Hook
    def self.after_install_or_update_spec(_spec)
      git_dir = `git rev-parse --git-dir`.strip

      puts 'Installing hooks...'
      system "[ -f #{git_dir}/hooks/pre-push ] && rm #{git_dir}/hooks/pre-push"
      system "ln -s #{__dir__}/../../lib/scripts/pre-push.rb #{git_dir}/hooks/pre-push"

      puts 'Installing bin/pre-push...'
      system '[ -f bin/pre-push ] && rm bin/pre-push'
      system "ln -s #{__dir__}/../../lib/scripts/pre-push bin/pre-push"
      system 'chmod +x bin/pre-push'

      puts 'Done!'
    end
  end
end
