namespace :sebes_git_prepush do
  desc 'Install scripts into hooks/pre-push'
  task :install do
    git_dir = `git rev-parse --git-dir`.strip

    puts 'Installing hooks...'
    system "ln -s #{__dir__}/../../lib/scripts/pre-push.rb #{git_dir}/hooks/pre-push"
    puts 'Done!'
  end
end
