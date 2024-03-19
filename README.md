# fedora-helper

Small Tool to Ease tasks on Fedora, learning more bash, git and gh-cli

## OneLiner

### this will create a nre repository , set it as public, give it a name, add a symbolic README.md file on remote, define a "Description" for the repository, and when it's finished will be cloned and and change directory into it.

```bash

$ gh repo create <your-new-repo-name> --add-readme --description "your-very-original-description" --public -c && cd <your-new-repo-name>
```

## OneLiner 2

```bash

$ gh repo create --public <my generic-name> --description "My generic Description" --source=. --remote=upstream --push
```

### crete repository, makee it public, set a name, source your actual directory you are on to start the tracking file ".git", define the upstream and assumming you at leaste have a README.md file added to stack and 1 commit, it would be pushed (Yes this also assumes you are already authorized/logged in and your credentials and id set up, and inside the root directory of the project otherwise the source part would be pointless)

## OneLiner 3

```bash

$ mkdir -p <my-generic-repo-name> && cd <my-generic-repo-name> && git init && echo "Your generic description/message/details" >> README.md && git add README.md && git commit -m "My generic commit message and details" && gh repo create --public <my-generic-name> --source=. --description "My generic Description" --remote=upstream --push
```

### Same as before but create thee directory project, `cd` into it , adding the project directory initialization bye creating the README.md file to add for tracking, creating a commit message , and start the repository remote creation and when finished will push the commited file to track.
