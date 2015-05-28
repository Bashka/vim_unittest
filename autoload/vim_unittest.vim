" Date Create: 2015-05-28 10:27:43
" Last Change: 2015-05-28 11:22:05
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:Object = vim_lib#base#Object#

" AdapterInterface {{{
"" {{{
" Данный класс определяет интерфейс адаптеров систем xUnit, используемых пользователем.
" Класс-адапрет для конкретной системы xUnit должен реализовать приведенный интерфейс.
"" }}}
let s:Class = s:Object.expand()

"" {{{
" Метод выполняет тест-кейсы.
" @param string testDir Адрес каталога с выполняемыми тест-кейсами.
"" }}}
function! s:Class.run(testDir) " {{{
endfunction " }}}

let g:vim_unittest#AdapterInterface = s:Class
" }}}

"" {{{
" Метод возвращает объект-адаптер используемой системы xUnit.
" @return vim_unittest#xUnit Объект-адаптер используемой системы xUnit.
"" }}}
function! vim_unittest#getAdapter() " {{{
  exe 'return g:vim_unittest_' . g:vim_unittest#.adapter . '#adapter.new()'
endfunction " }}}

"" {{{
" Метод выполняет тест-кейсы.
"" }}}
function! vim_unittest#run() " {{{
  call vim_unittest#getAdapter().run(g:vim_unittest#.testDir)
endfunction " }}}
