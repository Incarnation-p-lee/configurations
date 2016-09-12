" Incarnation P. Lee <incarnation.p.lee@outlook.com>
" Date: Thu Jan  7 18:05:21 CST 2016
" Standard C syntax

syntax clear
syntax case match

" status
highlight StatusLine ctermbg=110 ctermfg=196
" set fold color
highlight Folded ctermbg=239 ctermfg=88
" set cursorcolumn color
highlight CursorColumn ctermbg=233

"
" Keyword
"
" type
syntax keyword type int double short float long unsigned signed char void
syntax keyword type bool boolean uint16_t int16_t uint32_t int32_t
syntax keyword type bool boolean uint16 sint16 uint32 sint32 uint64 sint64 uint8 sint8
syntax keyword type uint64_t int64_t size_t 
syntax keyword type size_t ssize_t false true asm
syntax match type_def_0 / \w*_t$/
syntax match type_def_1 /\w*_t[) ;]/he=e-1
syntax match type_def_2 /^\w*_t$/
highlight type ctermfg=40
highlight link type_def_0 type
highlight link type_def_1 type
highlight link type_def_2 type

" keyword in C
syntax keyword keyword_basic break case const continue default do else
syntax keyword keyword_basic extern for goto if register restrict
syntax keyword keyword_basic return sizeof static switch typedef
syntax keyword keyword_basic volatile while auto inline
highlight keyword_basic ctermfg=199

setlocal iskeyword +=#
" macro
syntax match macro_cnd /#if/
syntax match macro_cnd /#endif/
syntax match macro_cnd /#else/
syntax keyword marco #define #ifdef #ifndef #defined
syntax keyword marco #elsif defined #undef
highlight marco ctermfg=60
highlight link macro_cnd macro

" charactor
syntax match char /'[0-9A-Za-z~`!@#$%^&*()-=_+|\?><,./]'/
highlight char ctermfg=196

" structure & union & enum
syntax match struct_inline contained /\(struct\|union\|enum\) \w*[ ),{]/hs=s+6,he=e-1
syntax match enum_inline contained /enum \w*[ ),{]/hs=s+4,he=e-1
syntax match struct /\(struct\|union\|enum\) [a-zA-Z_{]/he=e-1 contains=struct_inline,enum_inline
syntax match struct_typedef /s_\w\+_t/
highlight struct_inline ctermfg=93
highlight link enum_inline struct_inline
highlight struct ctermfg=23
highlight link struct_typedef struct

" include
syntax match included contained /#include .*/hs=s+9
syntax match include display /#include [<|"]/ contains=included
highlight include ctermfg=89
highlight included ctermfg=100

" string
syntax match string_format contained /%#\?\d\{0,3\}\.\?\d\{0,3\}l\{0,2\}[a-zA-Z]/
syntax region string start="\"" end="\"" contains=string_format
highlight string_format ctermfg=23
highlight string ctermfg=197

" comments
syntax match comment "//.*"
syntax region comment_1 start="/\*" end="\*/"
syntax region comment_1 start="#if \(0\|false\)" start="#else" end="#\(else\|endif\)"
highlight comment ctermfg=238
highlight link comment_1 comment

" pointer
syntax match pointer "\*\{1,3\}\w\+"
syntax match pointer "&[(]\?\w\+"
syntax match pointer "->\w\+"
syntax match pointer "\.\w\+"
highlight pointer ctermfg=202

" operation
syntax match operation " [?:+=\-\*/&|~%^] "
syntax match operation " [<>!] "
syntax match operation " [<>!]= "
syntax match operation " [+=\-\*/&|~]="
syntax match operation " \(&&\|||\) "
syntax match operation " \(&&\|||\)$"
syntax match operation "!"
syntax match operation "++"
syntax match operation " >>=\? "
syntax match operation " <<=\? "
syntax match operation " &&=\? "
syntax match operation "--"
highlight operation ctermfg=154

" number
syntax match number "[0-9]\+\.\?[0-9]*"
syntax match number "0x[0-9a-fA-F]\+"
highlight number ctermfg=196

" Predefined macro
syntax keyword predef NULL __FILE__ __LINE__ __FUNCTION__
highlight predef ctermfg=197

" function
syntax match symbol_func /##/ contained
syntax match function "[a-zA-Z_]\(\w\|#\)*("he=e-1 contains=symbol_func
highlight function ctermfg=33
highlight symbol_func ctermfg=118

" label
syntax match label "\w\+:"
highlight label ctermfg=49

" tail space
syntax match tspace "\s\+$"
highlight tspace ctermbg=196

" inline assembly
syntax match immediate contained "\$\w\+"
syntax match assembly contained "%%\w\+"
syntax match args contained "%\d"
syntax match inline_assembly "\".*\\n\\t\"" contains=immediate,assembly,args
highlight immediate ctermfg=171
highlight assembly ctermfg=114
highlight args ctermfg=117
highlight inline_assembly ctermfg=125

" ## symbol
syntax match symbol /##/
highlight symbol ctermfg=118

