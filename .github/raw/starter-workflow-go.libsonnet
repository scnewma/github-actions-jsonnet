// This is a rewrite of the github actions starter workflow for go. This
// rewrite allows the user to customize everything about the source workflow
// without throwing away the structure it gives.
//
// Ideally this would live in a central repository so it could be referenced by
// many teams. Any improvements could be made to a single place and benefit
// all, while still allowing the flexibility to change as needed.
//
// Rewrite of:
// https://github.com/actions/starter-workflows/blob/main/ci/go.yml

local github = import 'github.libsonnet';

{
  // override in case you have a different default branch
  _default_branch:: 'main',

  name: 'main',
  on: {
    push: { branches: [$._default_branch] },
    pull_request: { branches: [$._default_branch] },
  },
  jobs: {
    build: github.Job {
      local build = self,

      _steps+:: {
        checkout: github.actions.checkout,

        setup_go: github.actions.setup_go {
          _idx: 20,
        },

        go_build: {
          _idx: 30,
          name: 'build',
          run: |||
            go build -v ./...
          |||,
        },

        go_test: {
          _idx: 40,
          name: 'test',
          run: |||
            go test -v ./...
          |||,
        },
      },
    },
  },
}
