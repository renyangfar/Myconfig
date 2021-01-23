syntax on
set hlsearch
exec "nohlsearch"
set incsearch
set backspace=2
set clipboard=unnamed
set autoindent
set shiftwidth=4
set softtabstop=4
set expandtab
set wildmode=longest,list
set clipboard+=unnamedplus
set nrformats+=alpha
set completeopt=longest,menuone
set cursorline
set nu
set splitright
set splitbelow
set ignorecase
set smartcase
set encoding=utf-8



" 搜索关键字样式
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow

" 游标所在行样式
"hi CursorLine term=bold cterm=bold guibg=Grey40
hi CursorLine ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
"autocmd InsertEnter,InsertLeave * set cul!
hi Pmenu ctermbg=237 ctermfg=white cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermbg=242 ctermfg=white
hi LineNr ctermfg=245
" theme config
"colorscheme hybrid
"colorscheme darkburn
"au Filetype go colorscheme darkburn
"au Filetype python colorscheme hybrid_material
" 左右分屏竖线样式
set fillchars+=vert:│
hi VertSplit ctermfg=DarkGray ctermbg=Black
"highlight String guifg=200 guibg=100
hi String ctermfg=215 ctermbg=NONE
highlight Comment ctermfg=Gray


au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let mapleader=','

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

"noremap <A-h> <c-w>h
"noremap <A-j> <c-w>j
"noremap <A-k> <c-w>k
"noremap <A-l> <c-w>l

inoremap <C-n> <C-x><C-o>
inoremap <C-@> <C-n>
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
vnoremap p "_dP

map s <nop>
map W :w<CR>
map Q :q<CR>
map Y y$
map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
"au Filetype json map <leader>F :execute '%!python -m json.tool' \| w<CR>
"au Filetype json map <leader>F :%! jq --indent 4 .<CR>
map <leader>F :Autoformat<CR>
map <leader>s :e ~/.config/nvim/init.vim<CR>
map <leader>S :source $VIMRC<CR>
map <leader>o :vs $VIMRC<CR>
map <space>w :w !sudo tee %<CR>
map <space>i :r !figlet
"map <backspace> :nohl<CR>
map so :let current_line = line(".") <CR> :tabedit %<CR> :exe current_line <CR> zz
map sc :tabclose<CR>
" <c-_> --> <c-/>
map <c-_> :e #<CR>
map <c-h> :tabprevious<CR>
map <c-l> :tabnext<CR>
map <expr> = tabpagenr("$")>1 ? ':tabnext<CR>':':bnext<CR>'
map <expr> - tabpagenr("$")>1 ? ':tabprevious<CR>':':bprevious<CR>'
map s1 :b1<CR>
map sp :sp<CR>
map sv :vs<CR>
map tt :terminal<CR>
map <space>o :!echo "" > /tmp/.tmp<CR>
map <silent> <leader>/ :Ag <c-r><c-w><CR>
"map <space>n :set number! number?<cr>:IndentLinesDisable<cr>:GitGutterDisable<cr>:CocDisable<cr>
map <space>n :set nonumber<cr>:IndentLinesDisable<cr>:GitGutterDisable<cr>:CocDisable<cr>
map <space>N :set number<cr>:IndentLinesEnable<cr>:GitGutterEnable<cr>:CocEnable<cr>

tnoremap jj <c-\><c-n>

"back to last inset all buffers
autocmd InsertLeave * execute 'normal! mI'
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

map R :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!python3 %'
    elseif &filetype == 'go'
        "exec '!time go run %'
        exec '!go run %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc


"let g:clipboard = {
            "\   'name': 'xclip-xfce4-clipman',
            "\   'copy': {
            "\      '+': 'xclip -selection clipboard',
            "\      '*': 'xclip -selection clipboard',
            "\    },
            "\   'paste': {
            "\      '+': 'xclip -selection clipboard -o',
            "\      '*': 'xclip -selection clipboard -o',
            "\   },
            "\   'cache_enabled': 1,
            "\ }

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0ng/vim-hybrid'
Plug 'tmhedberg/simpylfold'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
Plug 'Yggdroot/indentLine'
Plug 'lfv89/vim-interestingwords'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'rking/ag.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'raimondi/delimitmate'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'flazz/vim-colorschemes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'ianva/vim-youdao-translater'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'tmux-plugins/vim-tmux-focus-events'
"Plug 'roxma/vim-tmux-clipboard'
call plug#end()


" delimitmate
let delimitMate_expand_cr = 1
"let delimitMate_expand_space = 8

" snippets plug config
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger ="<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" snippets plug config

" fold config
set foldmethod=indent
set foldlevel=99


" tagbar config
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" multiple-cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-g>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<C-g>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" easymotion config
map s <Plug>(easymotion-prefix)
nmap ss <Plug>(easymotion-s2)
nmap sj <Plug>(easymotion-j)
nmap sk <Plug>(easymotion-k)
nmap sh <Plug>(easymotion-jumptoanywhere)

" vim-fugitive
nmap gd :Gdiffsplit<cr>

" gitgutter
let g:gitgutter_enabled = 1

" indentLine
let g:indentLine_enabled=1
autocmd Filetype json let g:indentLine_setConceal = 0

" nerdtree config
let g:NERDTreeWinSize=25
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>V :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeAutoDeleteBuffer=1

" nerdcommenter
let g:NERDSpaceDelims=0
noremap s/ :call NERDComment(0,"toggle")<CR>
vnoremap s/ :call NERDComment(0,"toggle")<CR>

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ctrlp
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlPMixed'
map <leader>b :CtrlPBuffer<CR>

" fzf.vim
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"nmap gb :Buffers<cr>
nmap gp :Files<cr>
nmap gm :Maps<cr>
nmap gc :Commands<cr>
" Border color
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo' } }
" Border style (rounded / sharp / horizontal)
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'sharp' } }

" remove the filetype part
"let g:airline_section_c=''
"let g:airline_section_x=''
"let g:airline_section_b=''
"let g:airline_section_y=''
let g:airline_theme='cool'

let g:airline#extensions#tabline#enabled = 1
" remove separators for empty sections
let g:airline_skip_empty_sections = 1


" vim-go
let g:go_fmt_autosave = 0
"let g:go_fmt_experimental = 1
"au Filetype go nmap <leader>d :GoDef<CR>
"au Filetype go nmap <leader>g :GoDoc<CR>
au Filetype go nmap <leader>i :GoImports<CR>
"au Filetype go nmap <leader>I :GoImport <C-r><C-w><CR>
"au Filetype go nmap <leader>n :GoRename<CR>
"au Filetype go nmap <leader>T :GoTest<CR>
"au Filetype go nmap <leader>l :GoLint<CR>
"let g:go_fmt_autosave = 0
"let g:go_imports_autosave = 0
"let g:go_mod_fmt_autosave = 0
let g:go_doc_popup_window = 1
let g:go_doc_keywordprg_enabled = 1

let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 0
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
"goDiagnosticWarning
let g:go_highlight_diagnostic_warnings = 0


" leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = 'gh'
let g:Lf_ShortcutB = 'gb'
"let g:Lf_CommandMap = {
"\   '<C-k>': ['<C-p>'],
"\   '<C-j>': ['<C-n>'],
"\}
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}



" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>

" ale
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'sh': ['shellcheck'],
\}


" youdao
vnoremap <silent> yd :<C-u>Ydv<CR>
nnoremap <silent> yd :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

" rainbow
let g:rainbow_active = 1


