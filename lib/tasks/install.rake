namespace :sebes_git_prepush do
  desc 'Install scripts into hooks/pre-push'
  task :install do
    git_dir = `git rev-parse --git-dir`.strip

    puts 'Installing hooks/pre-push...'
    system "[ -f #{git_dir}/hooks/pre-push ] && rm #{git_dir}/hooks/pre-push"
    system "ln -s #{__dir__}/../../lib/scripts/pre-push.rb #{git_dir}/hooks/pre-push"
    
    puts 'Installing bin/pre-push...'
    system "[ -f bin/pre-push ] && rm bin/pre-push"
    system "ln -s #{__dir__}/../../lib/scripts/pre-push bin/pre-push"
    
    puts 'Done!'
  end
end
