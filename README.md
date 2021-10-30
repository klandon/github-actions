# github-actions-runner

This repo holds Dockerfiles for simplistic GitHub Self Hosted Runners
* Quick Notes
  * You can modify Environment Variable RUNNER_VER to change release
    * You can find release information here : [Runner Releases](https://github.com/actions/runner/releases)
  * Each Folder represent the agent architecture
    * Example "LinuxX64" "Linux based X64"
# Current Build Status
* LinuxX64
  * [![Docker Image CI](https://github.com/klandon/github-actions/actions/workflows/docker-image.yml/badge.svg)](https://github.com/klandon/github-actions/actions/workflows/docker-image.yml)
# How To Use Locally
To run locally switch the directory of the Architecture you want and run the docker build command
```console
docker build . -t github-runner
```
If using MAC with M1 and you want to build x64 or other architectures you may need to use the "buildx" option
```console
docker buildx build --platform linux/amd64 . -t github-runner
```
Once built follow the instructions in GitHub for setting up self hosted runners located here : [Adding self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners), you will need the token and url from this process.

After you have the token and URL you can run a command such as below to add the runner
```console
docker run -ti  --name github-runner \              
  -e RUNNER_NAME="runner1" \
  -e RUNNER_TOKEN="<YOUR TOKEN>" \
  -e RUNNER_WORKDIR="/tmp/test" \
  -e ORG_RUNNER="true" \
  -e ORG_NAME="<YOUR ORG NAME>" \
  -e LABELS="test-runner,org-runer" \
  -e SHORT_URL="<YOUR URL> " \
  github-runner
```
If everything is good you should see an output such as 
```console
Set Configuration
--------------------------------------------------------------------------------
|        ____ _ _   _   _       _          _        _   _                      |
|       / ___(_) |_| | | |_   _| |__      / \   ___| |_(_) ___  _ __  ___      |
|      | |  _| | __| |_| | | | | '_ \    / _ \ / __| __| |/ _ \| '_ \/ __|     |
|      | |_| | | |_|  _  | |_| | |_) |  / ___ \ (__| |_| | (_) | | | \__ \     |
|       \____|_|\__|_| |_|\__,_|_.__/  /_/   \_\___|\__|_|\___/|_| |_|___/     |
|                                                                              |
|                       Self-hosted runner registration                        |
|                                                                              |
--------------------------------------------------------------------------------
# Authentication
√ Connected to GitHub
# Runner Registration
√ Runner successfully added
√ Runner connection is good
# Runner settings
√ Settings Saved.
√ Connected to GitHub
2021-10-30 20:17:26Z: Listening for Jobs
```
If you want to mount the docker socket you will need to add
```console
-v /var/run/docker.sock:/var/run/docker.sock 
```

# How to Use in Kubernetes
Coming soon ....

# How To Contribute
Currently not accepting PRs or code commits from the public, but feel free to fork!



