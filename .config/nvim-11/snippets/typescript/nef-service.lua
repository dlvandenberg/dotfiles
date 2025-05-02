local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("typescript", {
  s(
    { trig = "nefss" },
    fmta(
      [[
        const initialState = {};

        @Injectable()
        export class <> extends StateManager<<typeof initialState>> {
          constructor() {
            super(initialState);
          }

          <>
        }
      ]],
      { i(1), i(0) }
    )
  ),
})
