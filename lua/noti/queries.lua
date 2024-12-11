local M = {}

M["folds"] = [[
(node_type_definition) @fold
(type_value_definition) @fold
(children_definition) @fold

(line_comment) @fold
(block_comment) @fold

]]

M["highlights"] = [[
(node_type_definition name: (identifier) @type.builtin)
(type_value_identifier) @type.builtin

(property_definition name: (identifier) @variable.member)

[
 "("
 ")"
 "{"
 "}"
] @punctuation.bracket

(",") @punctuation.delimiter

(bool) @boolean
(color) @string.special
(uint) @number
(literal) @string

(line_comment) @comment @spell
(block_comment) @comment @spell

]]

M["indents"] = [[
((constructor) @indent.align
    (#set! indent.open_delimiter "(")
    (#set! indent.close_delimiter ")"))

((children_definition) @indent.align
    (#set! indent.open_delimiter "{")
    (#set! indent.close_delimiter "}"))

]]

return M