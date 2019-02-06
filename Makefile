export DEFAULT_HELP_TARGET ?= help
export HELP_FILTER ?= help|init|codefresh/sync
export BUILD_HARNESS_BRANCH ?= 0.15.3
-include $(shell curl -sSL -o .build-harness "https://git.io/build-harness"; echo .build-harness)

## Project name
PROJECT ?= cloudposse-pipelines

## Repos to sync pipelines
REPOSITORIES ?= $(shell cat repositories.txt)

## Codefresh accounts to operate with
ACCOUNTS ?= cloudposse

## Pipelines for `cloudposse`
CLOUDPOSSE_PIPELINES ?= lint