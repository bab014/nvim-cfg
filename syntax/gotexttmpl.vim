" Copyright 2011 The Go Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.
"
" gotexttmpl.vim: Vim syntax file for Go templates.

" Quit when a (custom) syntax file was already loaded
" a modified version of gotexttmpl.vim
if exists("b:current_syntax")
  finish
endif


runtime! syntax/go.vim
unlet b:current_syntax

" Token groups
syn cluster     gotplLiteral     contains=goString,goRawString,goCharacter,@goInt,goFloat,goImaginary
syn keyword     gotplControl     contained   if else end range with template
syn keyword     gotplFunctions   contained   and html index js len not or print printf println urlquery eq ne lt le gt ge
syn match       gotplVariable    contained   /\$[a-zA-Z0-9_]*\>/
syn match       goTplIdentifier  contained   /\.[^[:blank:]}]\+\>/
syn match       goTplDefine      contained   /define/
syn match       goTplPipe        contained   /|/

hi def link     gotplControl        Keyword
hi def link     gotplFunctions      Function
hi def link     goTplVariable       Special

syn region gotplAction start="{{" end="}}" contains=@gotplLiteral,gotplControl,gotplFunctions,gotplVariable,goTplIdentifier,goTplDefine,goTplPipe display
syn region goTplComment start="{{\(- \)\?/\*" end="\*/\( -\)\?}}" display

hi def link goTplComment Comment

hi gotplAction guifg=#efbd5d
hi goTplDefine guifg=#41a7fc
hi goTplPipe   guifg=#34bfd0

let b:current_syntax = "gotexttmpl"

" vim: sw=2 ts=2 et
