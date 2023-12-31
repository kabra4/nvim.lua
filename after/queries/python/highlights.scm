;; extends 

(("break" @keyword) (#set! conceal "B"))
(("else" @conditional) (#set! conceal "e"))
((yield ("from") @keyword) (#set! conceal "F"))
(("for" @repeat) (#set! conceal "F"))
(("del" @keyword) (#set! conceal "D"))
(("if" @conditional) (#set! conceal "?"))
(("yield" @keyword) (#set! conceal "Y"))
(("lambda" @include) (#set! conceal "λ"))
(("not" @keyword.operator) (#set! conceal "!"))
(("or" @keyword.operator) (#set! conceal "|"))
(("return" @keyword) (#set! conceal "R"))
(("class" @keyword) (#set! conceal "c"))
(("global" @keyword) (#set! conceal "G"))
((call function: (identifier) @function.builtin (#eq? @function.builtin "print")) (#set! conceal "p"))
((import_from_statement ("from") @include) (#set! conceal "f"))
(("def" @keyword.function) (#set! conceal "f"))
(("while" @repeat) (#set! conceal "W"))
(("and" @keyword.operator) (#set! conceal "&"))
(("with" @keyword) (#set! conceal "w"))
(("assert" @keyword) (#set! conceal "?"))
(("import" @include) (#set! conceal "i"))
(("elif" @conditional) (#set! conceal "e"))
(("pass" @keyword) (#set! conceal "P"))
(("continue" @keyword) (#set! conceal "C"))
