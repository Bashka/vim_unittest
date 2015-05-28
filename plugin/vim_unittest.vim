" Date Create: 2015-05-28 10:27:30
" Last Change: 2015-05-28 11:16:16
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:Plugin = vim_lib#sys#Plugin#

let s:p = s:Plugin.new('vim_unittest', '1')

" Опции {{{
"" {{{
" @var string Имя адаптера для используемой пользователем системы xUnit.
"" }}}
let s:p.adapter = ''
"" {{{
" @var string Адрес каталога, содержащего тест-кейсы.
"" }}}
let s:p.testDir = ''
" }}}

"" {{{
" Выполнить тест-кейсы.
"" }}}
call s:p.menu('Run', 'run', 1)

"" {{{
" Выполнить тест-кейсы.
"" }}}
call s:p.comm('UnitTestRun', 'run()')

call s:p.reg()
