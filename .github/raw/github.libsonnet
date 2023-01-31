local join(arr) =
  local notNull(i) = i != null;
  local maybeFlatten(acc, i) = if std.type(i) == 'array' then acc + i else acc + [i];
  std.foldl(maybeFlatten, std.filter(notNull, arr), []);

local MAX_IDX = 1000;

{
  local github = self,

  // before is a helper function to order a given step before the provided step
  before(step):
    { _idx:: std.get(step, '_idx', default=MAX_IDX) - 1 },

  // after is a helper function to order a given step after the provided step
  after(step):
    { _idx:: std.get(step, '_idx', default=MAX_IDX) + 1 },

  // Job creates a customizable github actions job.
  // Steps should be defined in _steps with order defined with _idx fields in
  // the step. This is done so that the job is customizable by the end-user.
  Job: {
    local job = self,

    _steps:: {},

    __steps:: [
      github.Step + job._steps[k]
      for k in std.objectFields(job._steps)
    ],

    steps: std.sort(job.__steps, keyF=function(o) std.get(o, '_idx', default=MAX_IDX)),
  },

  Step: {
    // default which is masked to prevent output
    _idx:: MAX_IDX,
  },
}
