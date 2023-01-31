local github = import 'github.libsonnet';

(import './main.jsonnet') {
  jobs+: {
    build+: { _steps+: {
      local steps = self,

      checkout+: {
        with+: {
          // this is the default, just showing that you can override
          'fetch-depth': 1,
        },
      },

      pre_checkout: github.before(steps.checkout) {
        run: 'echo "pre checkout"',
      },

      post_checkout: github.after(steps.checkout) {
        run: 'echo "post checkout"',
      },
    } },
  },
}
