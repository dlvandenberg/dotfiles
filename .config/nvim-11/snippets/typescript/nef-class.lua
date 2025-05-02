local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.add_snippets("typescript", {
  s(
    { trig = "nefcl" },
    fmta(
      [[
        @Component({
          selector: '<>',
          templateUrl: './<>.html',
          styleUrl: './<>.scss',
          imports: [],

        })
        export class <> extends BaseUiComponent {
          private static readonly className = '<>';

          constructor() {
            super();
          }

          public get hostClassName(): string {
            return <>.className;
          }

          <>
        }
      ]],
      {
        i(1),
        i(2),
        rep(2),
        i(3),
        rep(1),
        rep(3),
        i(0),
      }
    )
  ),
})
