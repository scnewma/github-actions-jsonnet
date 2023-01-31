// "Final" workflow.

local github = import 'github.libsonnet';

(import './starter-workflow-go.libsonnet') {
  jobs+: {
    build+: { _steps+: {
      local steps = self,

      checkout+: {
        with+: {
          // this is the default, just showing that you can override a step's configuration
          'fetch-depth': 1,
        },
      },

      // run some action before checkout
      pre_checkout: github.before(steps.checkout) {
        run: 'echo "pre checkout"',
      },

      // run some action after checkout
      post_checkout: github.after(steps.checkout) {
        run: 'echo "post checkout"',
      },
    } },
  },
}
