if exists("current_compiler")
  finish
endif

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:gradlew = escape(findfile('gradlew', '.;'), '\')
let current_compiler = s:gradlew
execute "CompilerSet makeprg =" . s:gradlew
CompilerSet errorformat=%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#


