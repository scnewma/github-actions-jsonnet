local github = import 'github.libsonnet';

(import './main.jsonnet') {
  jobs+: {
    build+: { _steps+: {
      local steps = self,

      checkout+: {
        with+: {
          path: 'myrepo',
        },
      },

      pre_checkout: github.before(steps.checkout) {
        runs: 'echo "pre checkout"',
      },

      post_checkout: github.after(steps.checkout) {
        runs: 'echo "post checkout"',
      },
    } },
  },
}
