{
  name: 'main-generated',
  on: {
    workflow_call: { inputs: {} },
  },
  jobs: {
    hello: {
      'runs-on': 'ubuntu-latest',
      steps: [
        {
          run: |||
            echo 'hello world',
          |||,
        },
      ],
    },
  },
}
