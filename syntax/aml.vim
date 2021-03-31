" File:        syntax/aml.vim
" Author:      Anthony Jackson
" Description: Vim syntax highlighting

if exists('b:current_syntax')
  finish
endif

syn keyword	tagTypes	string str int integer contained
syn match	tagContent	'\w*' contained
syn match	preamble	'^\.*[^.]*\.' contains=tagContent,tagTypes

hi def link preamble	Comment
hi def link tagContent	Function
hi def link tagTypes	Type

let b:current_syntax = 'aml'

" Copyright (C) 2013: gmail -> expelledboy - All rights reserved
" vim: set ft=vim :
