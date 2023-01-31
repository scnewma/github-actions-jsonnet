# github-actions-testing

Example repository showcasing one possible way to create "reusable workflows"
by generating them instead of using the Github Actions provided reusable
workflows.

More details in each of the following files:

* `.github/raw/github.libsonnet` - generic github actions jsonnet library
* `.github/raw/starter-workflow-go.libsonnet` - represents a basic go workflow that is entirely costumizable by the end-user (w/o copy-pasting and throwing away upstream).
* `.github/raw/main.jsonnet` - "main" workflow defined with the above libraries. when `make github` is ran it generates `.github/workflows/main.yml`
