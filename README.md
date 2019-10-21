[![Docker Status](https://images.microbadger.com/badges/version/ngalayko/bazel-action.svg)](https://hub.docker.com/r/ngalayko/bazel-action/ "Latest Docker HUB image")
[![Docker Hub](https://img.shields.io/docker/pulls/ngalayko/bazel-action.svg)](https://hub.docker.com/r/ngalayko/bazel-action/ "Docker Pulls")

# Bazel Action

This actions allows you to run bazel commands.

## How to use

Create a `.github/workflows/workflow.yml` file with the following contents:
```yaml
on: push
name: My Action
job:
  checks:
    name: run
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master

    - name: run
      uses: ngalaiko/bazel-action/1.0.0@master
      with:
        args: build //...
```

## bazel version

In order to speed up builds, `ngalaiko/bazel-action/<version>@<tag>` uses prebuilt images with installed bazel 
and all dependencies. Images are stored in the (DockerHub)[https://cloud.docker.com/u/ngalayko/repository/docker/ngalayko/bazel-action].

If you need a specific bazel version, you can import it by changeing `uses` import path. For example:

```yaml
uses: ngalaiko/bazel-action/1.0.0@master
```

or

```yaml
uses: ngalaiko/bazel-action/0.29.0@master
```

If you need another version, please open an issue, or send a PR.

If you don't want to use a prebuild image, the action with the bazel's latest version is always accessible via
`ngalaiko/bazel-action@master`.

## GitHub actions

You can read more about GitHub actions in the [documentation](https://help.github.com/en/categories/automating-your-workflow-with-github-actions).
