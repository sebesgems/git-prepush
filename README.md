# Git Prepush

A gem that installs a pre-push git hook plus a `bin/pre-push` script that runs
project health checks (RuboCop, Sorbet, Brakeman, DatabaseConsistency, tests)
before each push.

Checks are **auto-detected**: a step runs only if its config or gem is present
in the project. A Ruby gem with no Rails won't run Brakeman; a project without
`sorbet/config` won't run `srb tc`. No editing required to drop unused steps.

## Install

Add to `Gemfile`:

```ruby
group :development, :test do
  gem 'git_prepush', git: 'https://github.com/sebesgems/git-prepush.git', require: false
end
```

Then run:

```sh
bundle exec rake git_prepush:install
```

This installs:

- `.git/hooks/pre-push` — git hook that calls `bin/pre-push` when the push has new commits
- `bin/pre-push` — the checker script (safe to edit per project; rerun install to reset)

## Detection rules

| Step                | Runs when                                                    |
| ------------------- | ------------------------------------------------------------ |
| RuboCop             | `.rubocop.yml` exists or `rubocop` is in `Gemfile.lock`      |
| Brakeman            | Rails app (`config/application.rb`) + `brakeman` in lockfile |
| DatabaseConsistency | `database_consistency` in lockfile                           |
| Sorbet              | `sorbet/config` exists                                       |
| Tests               | `bin/tests`, else `bin/rails test`, RSpec, or `rake test`    |

Binstubs (`bin/rubocop`, `bin/srb`, …) are preferred over `bundle exec`.

## Skipping steps

Global skip — bypass everything:

```sh
CI_PREPUSHSKIP=1 git push
```

Per-step skip:

```sh
CI_PREPUSHSKIP_RUBOCOP=1 git push
CI_PREPUSHSKIP_BRAKEMAN=1 git push
CI_PREPUSHSKIP_DB_CONSISTENCY=1 git push
CI_PREPUSHSKIP_SORBET=1 git push
CI_PREPUSHSKIP_TESTS=1 git push
```

Auto-skipped checks (tool not present) stay silent. Env-skipped checks log a
`! skipped` line so you know they were overridden.

## Customizing

`bin/pre-push` is installed into your project and is meant to be edited. Add
project-specific checks there. Rerunning `rake git_prepush:install` overwrites
it back to the default detector script.
