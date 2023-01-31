local github = import 'github.libsonnet';

{
  name: 'main',
  on: {
    push: {},
    pull_request: {},
  },
  jobs: {
    build: github.Job {
      local build = self,

      'runs-on': 'ubuntu-latest',

      _steps+:: {
        checkout: {
          _idx: 10,
          uses: 'actions/checkout@v3',
        },

        setup_go: {
          _idx: 20,
          uses: 'actions/setup-go@v3',
          with: { 'go-version': '1.19' },
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
