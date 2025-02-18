# Sebes Git Prepush

This gem installs prepush scripts to go through all checkers. 
It will be automaticaly installed.

## Modify

It will create a file bin/pre-push. This file is executable `bin/pre-push`.
You can modify scripts which are there in case you don't need some of them 

## Install

After gem is installed please run:

```
rake sebes_git_prepush:install
```


## Install into the project
Add to Gemfile:
```
group :development, :test do
  gem "sebes_git_prepush", git: "https://github.com/sebesgems/git-prepush.git" # It should be required!
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
