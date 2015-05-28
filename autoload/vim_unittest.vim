" Date Create: 2015-05-28 10:27:43
" Last Change: 2015-05-28 17:06:03
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
" @param string testDir Адрес каталога с тест-кейсами.
"" }}}
function! s:Class.new(testDir) " {{{
  let l:obj = self.bless(a:testDir)
  "" {{{
  " @var string Адрес каталога с тест-кейсами.
  "" }}}
  let l:obj.testDir = a:testDir
  return l:obj
endfunction " }}}

"" {{{
" Метод выполняет тест-кейсы.
" @param string testDir Адрес каталога с выполняемыми тест-кейсами.
"" }}}
function! s:Class.run(testDir) " {{{
endfunction " }}}

let g:vim_unittest#AdapterInterface = s:Class
" }}}

"" {{{
" @return string Адрес текущего файла тест-кейса относительно каталога тестов.
"" }}}
function! vim_unittest#__getCurrentTest() " {{{
  return substitute(expand('%'), '^' . g:vim_unittest#.testDir . '/', '', '')
endfunction " }}}

"" {{{
" Метод возвращает объект-адаптер используемой системы xUnit.
" @return vim_unittest#xUnit Объект-адаптер используемой системы xUnit.
"" }}}
function! vim_unittest#getAdapter() " {{{
  exe 'return g:vim_unittest_' . g:vim_unittest#.adapter . '#adapter.new("' . g:vim_unittest#.testDir . '")'
endfunction " }}}

"" {{{
" Метод выполняет все тест-кейсы в каталоге.
"" }}}
function! vim_unittest#run() " {{{
  call vim_unittest#getAdapter().run()
endfunction " }}}

"" {{{
" Метод выполняет указанный тест-кейс.
" @param string file Адрес выполняемого файла тест-кейсов относительно каталога тестов.
"" }}}
function! vim_unittest#runFile(file) " {{{
  call vim_unittest#getAdapter().runFile(a:file)
endfunction " }}}

"" {{{
" Метод выполняет открытый в данный момент тест-кейс.
"" }}}
function! vim_unittest#runCurrentFile() " {{{
  call vim_unittest#getAdapter().runFile(vim_unittest#__getCurrentTest())
endfunction " }}}

"" {{{
" Метод выполняет указанный тест.
" @param string file Адрес выполняемого файла тест-кейсов относительно каталога тестов.
" @param string test Имя выполняемого теста.
"" }}}
function! vim_unittest#runTest(file, test) " {{{
  call vim_unittest#getAdapter().runTest(a:file, a:test)
endfunction " }}}

"" {{{
" Метод выполняет тест, на котором установлен указатель.
"" }}}
function! vim_unittest#runCurrentTest() " {{{
  call vim_unittest#getAdapter().runTest(vim_unittest#__getCurrentTest(), expand('<cword>'))
endfunction " }}}
