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
      uses: ngalaiko/bazel-action@0.29.0
      with:
        args: build //...
```

You can read more about GitHub actions in the [documentation](https://help.github.com/en/categories/automating-your-workflow-with-github-actions).
