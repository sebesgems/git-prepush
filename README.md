# Sebes Git Prepush

This gem installs prepush scripts to go through all checkers. 
It will be automaticaly installed.

## Install into the project
Add to Gemfile:
```
group :development, :test do
  gem "sebes_git_prepush", require: false git: "https://github.com/sebesgems/git-prepush.git"
end
```
You have to add both locally and to the DigitalOcean server env:
```
BUNDLE_GITHUB__COM= -> LastPass -> Shared-dev -> SEBES_GEM_TOKEN
```
To `.github/workflow/ci.yml` should be added:
```
jobs:
  lint:
    env:
      BUNDLE_GITHUB__COM: x-access-token:${{ secrets.SEBES_GEM_TOKEN }}
```

## Access for GitHub actions 

In the projects Settings -> Actions -> New Secret add:

```
SEBES_GEM_TOKEN=-> LastPass -> Shared-dev -> SEBES_GEM_TOKEN
```

## Authenticate locally

```
bundle config --local github.com -> LastPass -> Shared-dev -> SEBES_GEM_TOKEN
```


## Manually install

Tou can nstall it manually using rake job:

```
rake sebes_git_prepush:install
```
