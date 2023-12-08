;; extends
":=" @lsp.type.type

(short_var_declaration
  left: (expression_list
          (identifier) @label))

[
 "<"
 ">"
 "++"
 "=="
 "!="
 "+="
 "*="
 "<<"
 ">>"
 "<="
 ">="
 ] @field
