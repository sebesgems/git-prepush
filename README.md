# Git Prepush

This gem installs prepush scripts to go through all checkers. 
It will be automaticaly installed.

## Modify

It will create a file bin/pre-push. This file is executable `bin/pre-push`.
You can modify scripts which are there in case you don't need some of them 

## Install

After gem is installed please run:

```
rake git_prepush:install
```


## Install into the project
Add to Gemfile:
```
group :development, :test do
  gem "git_prepush", git: "https://github.com/sebesgems/git-prepush.git" # It should be required!
end
```

## Modify

By default it runs the most common checkers to make sure that your project is healthy:

```
bundle exec rubocop
srb typecheck
bundle exec brakeman --exit-on-warn --no-summary
bundle exec rails test
```

Feel free to modify file `bin/pre-push` to satisfy needs of your projects.
