call plug#begin('~/.local/share/nvim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'google/yapf', { 'for': 'py' }
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'sirver/ultisnips'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'amadeus/vim-css'
call plug#end()

" Load the color scheme, fail silently
silent! colorscheme spring-night


" # LINE NUMBERS
" Open new horizontal splits below the current buffer
set splitbelow
"
" Open new vertical splits to the right of the current buffer
set splitright

" Set relative numbers, except for the current line
set relativenumber
set number

" Try to set absolute numbers for all buffers except the current one
" (misbehaves if vim opens multiple buffers at once)
autocmd WinLeave * :set norelativenumber
autocmd WinEnter * :set relativenumber

autocmd InsertEnter * :set cursorcolumn
autocmd InsertEnter * :set cursorline
autocmd InsertLeave * :set nocursorcolumn
autocmd InsertLeave * :set nocursorline

"
" # COMPLETION
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


" # KEYBOARD SHORTCUTS
" Save with Ctrl-s
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Quit buffer with Ctrl-d, quitall with Ctrl-q
noremap <C-d> :q<CR>
noremap <C-q> :quitall<CR>

" Switch to Normal mode with 'jj'
:inoremap jj <Esc>

" # FOLDING
set foldmethod=syntax
set foldlevelstart=20

" Enable folding with the spacebar
nnoremap <space> za

" # INVISIBLES
" toggle invisible characters
set listchars=tab:â†’\ ,eol:Â¬,trail:â‹…,extends:â¯,precedes:â®
set showbreak=â†ª


" Don't let editorconfig mess with vim diffs
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
"
" <Leader>t for TagBar
nmap <Leader>t :TagbarToggle<CR>

" Comment toml lines with '#'
autocmd FileType toml setlocal commentstring=#\ %s

" Use system clipboard by default
set clipboard=unnamed

" Prevent vim from creating a swp file while editing the crontab
set backupskip=/tmp/*,/private/tmp/*

" ctrlp should ignore gitignored files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

""""""""""
"""" Go
""""""""""

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" Type info on cursor position
let g:go_auto_type_info = 1
set updatetime=50

" " run :GoBuild or :GoTestCompile based on the go file
" function! s:build_go_files()
"   let l:file = expand('%')
"   if l:file =~# '^\f\+_test\.go$'
"     call go#cmd#Test(0, 1)
"   elseif l:file =~# '^\f\+\.go$'
"     call go#cmd#Build(0)
"   endif
" endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" Automatically highlight matching identifiers
let g:go_auto_sameids = 0

" <Leader>e for gorename
au FileType go nmap <Leader>e <Plug>(go-rename)

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

augroup templates
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/templates/skeleton.'.expand("<afile>:e")
augroup END

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

set nofileignorecase

set autoread

" function Yapf()
"   let save_pos = getpos('.')
"   silent! %!yapf
"   call setpos('.', save_pos)
" endfunction
" autocmd BufWrite *.py call Yapf()


noremap <Right> :vertical resize +1<CR>
noremap <Left>  :vertical resize -1<CR>
noremap <Up>    :resize -1<CR>
noremap <Down>  :resize +1<CR>

" Never replace a newline with two spaces when joining lines
set nojoinspaces

" fzf
set rtp+=/usr/local/opt/fzf
nnoremap <C-p>      :FZF<CR>
" let g:fzf_commands_expect = 'enter'

" github.com/SirVer/ultisnips triggers configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

set mouse=a
set undofile " Maintain undo history between sessions
set undodir=~/.cache/nvim/undodir

let g:netrw_home='~/.cache/nvim/netrw'

