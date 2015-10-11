" Incarnation P. Lee <incarnation.p.lee@gmail.com>
" Date: Fri Sep 26 20:43:59 CST 2014
" Standard C syntax

let b:current_syntax = "c"

" status
highlight StatusLine ctermbg=196 ctermfg=109
"highlight StatusLineNC ctermbg=164 ctermfg=196
" set fold color
highlight Folded ctermbg=239 ctermfg=154
" set cursorcolumn color
highlight CursorColumn ctermbg=233

" types
syntax keyword type int double short float long unsigned signed char void
syntax keyword type_plus bool boolean uint16_t int16_t uint32_t int32_t
syntax keyword type_plus bool boolean uint16 sint16 uint32 sint32 uint64 sint64 uint8 sint8
syntax keyword type_plus uint64_t int64_t size_t inline
syntax keyword type_plus size_t ssize_t false true asm
highlight type ctermfg=199
highlight link type_plus type

" keyword
syntax keyword keyword_basic break case const continue default do else
syntax keyword keyword_basic extern for goto if register restrict
syntax keyword keyword_basic return sizeof static switch typedef
syntax keyword keyword_basic volatile while auto
highlight keyword_basic ctermfg=40

" structure & union & enum
syntax match struct_name contained "struct \w*[ ),]"hs=s+7,he=e-1
syntax match struct_key display "struct [a-zA-Z_]" contains=struct_name
highlight struct_name ctermfg=99
highlight link struct_key keyword_basic

syntax match union_name contained "union \w* "hs=s+6
syntax match union_key display "union [a-zA-Z_]" contains=union_name
syntax match union_key display "union {"he=e-1 contains=union_name
highlight link union_name struct_name
highlight link union_key keyword_basic

syntax match enum_name contained "enum \w* "hs=s+5
syntax match enum_key display "enum [a-zA-Z_]" contains=enum_name
highlight link enum_name struct_name
highlight link enum_key keyword_basic


" include
syntax match included contained "#include .*"hs=s+9
syntax match include display "#include [<|\"]" contains=included
highlight include ctermfg=39
highlight included ctermfg=196


" string
syntax match string_format contained "%#\?\d\{0,3\}\.\?\d\{0,3\}[a-zA-Z]"
syntax region string display start="\"" end="\"" contains=string_format
highlight string_format ctermfg=172
highlight string ctermfg=196

" cpp
syntax match cpp contained "#\(define\|ifdef\|ifndef\|if\|else\|defined\|elif\)"
syntax match cpp_defined contained " \!\?defined"
syntax match cpp_name display "#\w\+\s\+\w\+" contains=cpp,cpp_defined
syntax match cpp_sp "#endif"
syntax match cpp_sp "#else"
highlight cpp ctermfg=90
highlight cpp_name ctermfg=154
highlight link cpp_sp cpp
highlight link cpp_defined cpp

" comment
syntax match comment_single "//.*"
highlight comment_single ctermfg=241
syntax region comment_mutiple display start="/\*" end="\*/"
" syntax region comment_if_0 display start="#if 0" end="#endif"
" syntax region comment_if_1 display start="#if 0" end="#else"
highlight link comment_mutiple comment_single
highlight link cCppOutIf2 comment_single
" highlight link comment_if_0 comment_single
" highlight link comment_if_1 comment_single

" pointer
syntax match pointer display "\*\{1,3\}\w\+"
syntax match pointer display "&\w\+"
syntax match pointer display "->\w\+"
syntax match pointer display "\.\w\+"
highlight pointer ctermfg=171

" operation
syntax match operation display " [?:+=\-\*/&|~%^] "
syntax match operation display " [<>!] "
syntax match operation display " [<>!]= "
syntax match operation display " [+=\-\*/&|~]="
syntax match operation display " \(&&\|||\) "
syntax match operation display " \(&&\|||\)$"
syntax match operation display "!"
syntax match operation display "++"
syntax match operation display " >>=\? "
syntax match operation display " <<=\? "
syntax match operation display " &&=\? "
syntax match operation display "--"
highlight operation ctermfg=262

" number
syntax match number display "[0-9]\+\.\?[0-9]*"
syntax match hex_number display "0x[0-9a-fA-F]\+"
highlight number ctermfg=130
highlight link hex_number number

" inline assembly
syntax match immediate contained "\$\w\+"
syntax match assembly contained "%%\w\+"
syntax match args contained "%\d"
syntax match inline_assembly display "\".*\\n\\t\"" contains=immediate,assembly,args
highlight immediate ctermfg=171
highlight assembly ctermfg=114
highlight args ctermfg=268
highlight inline_assembly ctermfg=265


" marco workaround
syntax match marco_workaround display "[A-Z]\+[0-9]*_\?[A-Z_0-9a-z]*"
highlight marco_workaround ctermfg=190

" function
syntax match function "[a-zA-Z_]\w*("he=e-1
highlight function ctermfg=33 cterm=bold

" label
syntax match label "\w\+:"
highlight label ctermfg=49

" tail space
syntax match tspace "\s\+$"
highlight tspace ctermbg=196

" cpp
syntax keyword cpp #define #ifdef #ifndef #if #else #defined #endif
syntax match cpp_defined contained " \!\?defined"
syntax match cpp_name display "#\w\+\s\+\w\+" contains=cpp,cpp_defined
highlight cpp ctermfg=90
" highlight cpp_name ctermfg=154
" highlight link cpp_defined cpp


