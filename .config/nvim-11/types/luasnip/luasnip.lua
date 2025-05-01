---@class SnippetOptions
---@field refresh_notify boolean
---@field type string

---@alias SnippetNode table
---@alias TextNode table
---@alias InsertNode table
---@alias Snippet table

---@class SnippetContext
---@field trig string
---@field regTrig? boolean
---@field wordTrig? boolean
---@field snippetType? "snippet"|"autosnippet"

---@class LuaSnip
---@field test string
local M = {}

---@param context SnippetContext|string Snippet context, or shorthand trigger string
---@param nodes SnippetNode[] List of snippet nodes
---@param opts? table Optional snippet options
---@return Snippet
function M.snippet(context, nodes, opts) end

------------ Nodes ------------

--- Add the given text as a string literal.
--- String table will create a multiline string
---@param text string|string[] Text to add, string table
---@return TextNode
function M.text_node(text) end

--- Add an insert node where the user can input text.
--- Index specifies the jump order.
---@param index number Node jump index
---@param text? string|string[] Optional placeholder text
function M.insert_node(index, text) end

--- Repeat a node's content with the given index
---@param index number Node index to repeat
function M.repeat_node(index) end

------------ Fn ---------------

--- Add snippets
---@param ft string The filetype that will load the snippets.
---@param snippets Snippet[] Table containing the snippets
---@param opts? SnippetOptions Options to pass on
function M.add_snippets(ft, snippets, opts) end

------------ extras ---------------

local E = {}
local F = {}

--- Format nodes in a human-readable way,
--- using '{}' as node placeholders
---@param format string
---@param nodes SnippetNode[]
---@param opts? table
---@return SnippetNode[]
function F.fmt(format, nodes, opts) end

--- Format nodes in a human-readable way,
--- using '<>' as node placeholders.
---@param format string
---@param nodes SnippetNode[]
---@param opts? table
---@return SnippetNode[]
function F.fmta(format, nodes, opts) end

E.fmt = F
M.extras = E

return M
