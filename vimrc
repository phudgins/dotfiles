execute pathogen#infect()
call pathogen#incubate()
let g:solarized_termcolors=16
let g:VimuxHeight = "45"
syntax enable             " Purdy colors
set background=dark
colorscheme solarized
set showmode              " Current mode and commands
set showcmd               "
set nowrap                " Don't make it look like there are line wraps

"let loaded_matchparen = 1 " Disable annyoing paren matching

set textwidth=100

set autoindent            " These 4 options format our files nicely
set tabstop=2             "
set shiftwidth=2          "
set expandtab             "
set pastetoggle=<F2>
set number
set ruler
set laststatus=2
filetype plugin indent on

filetype on

if has("autocmd")
  filetype indent on
endif

hi Comment term=bold ctermfg=lightblue guifg=lightblue

" We only want tabs for slim files
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd FileType slim setlocal noexpandtab

" We only want tabs for coffee files
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd FileType coffee setlocal noexpandtab

" Markdown!
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Insert timestamp with F3
nmap <F3> a<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

" No Arrow Keys!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Better gitcommit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Copy visual selection to clipboard
vmap <C-c> :w !pbcopy<CR><CR>

" Close Vimux runner
nmap ,c :VimuxCloseRunner<cr>

if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
		    \	if &omnifunc == "" |
		    \		setlocal omnifunc=syntaxcomplete#Complete |
		    \	endif
endif
