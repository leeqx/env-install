" Bundle Vundle configurations-
let g:python_host_prog = '/home/roop/virtual_env/neovim/bin/python'

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'oblitum/YouCompleteMe' , { 'do': './install.py --clang-completer' }
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-markdown'
Plugin 'kopischke/unite-spell-suggest'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Raimondi/delimitMate'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'DoxygenToolkit.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'oblitum/rainbow'
Plugin 'vim-scripts/a.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'bbchung/clighter'
Plugin 'troydm/zoomwintab.vim'
Plugin 'godlygeek/tabular'



"Add :myself"
Plugin 'airblade/vim-gitgutter'
Plugin 'jacobsimpson/nvim-terminal-velocity'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/bash-support.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/indent-motion'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"=============================================================================
"=============================================================================

set ttimeoutlen=50
set synmaxcol=1020
set nocursorline
set re=1
:redraw

" Configure for C++ Development
set exrc
set secure
set tabstop=4
set softtabstop=4
set noexpandtab
set colorcolumn=80
:set cursorline
:set t_ut=

" =====[ C++ formatting ]=====================================================
set cindent shiftwidth=4
set cinoptions=
set cinoptions+=l1
set cinoptions+=(1
set relativenumber

"=====[ Indent Guidelines ]===================================================
let g:indent_guides_auto_colors = 0

"=====[ Remap Leader Key ]====================================================
let mapleader = ","

"=====[ cycle through buffers ]===============================================
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" =====[ Add semicolins to the end of line ]==================================
:nnoremap <leader>; ms$A;<ESC>`s
:inoremap <leader>; <ESC>ms$A;<ESC>`s

"=====[ Moving line up or down ]==============================================

"=====[ vim-bbye, delete buffer but keep layout ]=============================
:nnoremap <Leader>q :Bdelete<CR>

" =====[ Remap to change windows quickly ]====================================
"":nmap <silent> <C-H> :wincmd h<CR>
"":nmap <silent> <C-J> :wincmd j<CR>
"":nmap <silent> <C-K> :wincmd k<CR>
"":nmap <silent> <C-L> :wincmd l<CR>

" =====[ Syntastic Config ]===================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['clang_check', 'cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++03 -stdlib=libc++'
let g:syntastic_shell = "/bin/sh"
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

"=====[ airline configuration ]===============================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_exclude_preview = 1

"=====[ ultisnips ]===========================================================
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-c>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"=====[ vim-cpp-enhanced-highlight ]==========================================
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"=====[ YouCompleteMe Configurations ]========================================
"let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_confirm_extra_conf = 0

let g:ycm_auto_trigger = 50
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_filepath_completion_use_working_dir = 1
set completeopt=longest,menu
noremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>" "回车选中
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"=====[oblitum/rainbow]=======================================================
au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1

"=====[ easy motion ]=========================================================
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>u <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-uinebackward)

map <Leader> <Plug>(easymotion-prefix)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"=====[ tmux line configuration ]=============================================
let g:tmuxline_preset = 'full'

" =====[ clighter ]===========================================================
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)
"let g:indentLine_color_term = 239
"let g:clighter_compile_args = ['-isystem /usr/lib/llvm-3.5/lib/clang/3.5.0/include',
""                              \'-I/home/roop/project',
""                              \'-std=c++03']
"let g:clighter_libclang_file="/home/nano/.config/nvim/bundle/YouCompleteMe/third_party/ycmd/libclang.so"
"nmap <silent> <Leader>r :call clighter#Rename()<CR>

"=====[ Confgiure the screen ]================================================
"let g:gruvbox_improved_warnings = 1
"let g:gruvbox_italic = 1
"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox

let g:rehash256 = 1
set t_Co=256
syntax enable
set background=dark
colorscheme solarized
let g:solarized_italic=1
let g:solarized_underline=1
let g:solarized_bold=2

"colorscheme wombat256
"colorscheme jellybeans
"colorscheme molokai

"=====[ Configure Airline ]===================================================
set laststatus=2
let g:airline_powerline_fonts = 1
set number
syntax on
set expandtab

nnoremap <F4> :wa <bar> :make!<cr>
"nmap wm :NERDTreeToggle<cr>
nmap <S-w> :NERDTreeToggle<cr>
 " auto open nerdtree  open vim without file and auto open nerdtree
autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
 


augroup BgHighlight
    autocmd!
    autocmd WinEnter * highlight ColorColumn ctermbg=yellow
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul

    "=====[ Indent Guidelines ]===============================================
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

    "autocmd BufReadPost quickfix map <buffer> <leader>qq :cclose<cr>
    ""                          \|map <buffer> <c-p> <up>
    ""                           \|map <buffer> <c-n> <down>

    autocmd GuiEnter * set background&
    
    "=====[ makefile binding ]================================================
    autocmd  BufRead,BufNewFile  *.cpp
        \ let &l:makeprg
        \ = 'make -f '.fnameescape(
            \substitute(expand('%'), '\m_test\.cpp$', '.makefile', ''))
augroup END

nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute"'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute"']+1"<CR>


"=================[promptline]======================== ==============================="
let g:promptline_preset = 'full'
"theme"
let g:promptline_theme = 'airline'
" or
"let g:promptline_theme = 'jelly'
" other themes available in autoload/promptline/themes/*

"===============[bling/vim-airline]========================== =================
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"================[airblade/vim-gitgutter]========================= ============
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines=1

"========================[nvim-terminal-velocity]==============================
"here is the help for nvim-terminal-velocity ,don't configure manual
"   ,tj - open a new terminal window below the current window.
"   ,tk - open a new terminal window above the current window.
"   ,th - open a new terminal window to the left of the current window.
"   ,tl - open a new terminal window to the right of the current window.
"   ,t. - open a new terminal window in the current window.

"========================nvim-terminal-emulator================================
" exit term (ESC) and then ctrl-w+w  to switch term and editor
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l


"===============[ctrlp_funky]=================================================
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"================[kien/ctrlp]========================= ========================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_multiple_files = 'v'   "open multiple file vsp
set wildignore+=*.so,*.swp,*.zip,*.o,*.bin
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
nmap mix :CtrlPMixed<cr>
nmap buf :CtrlPBuffer<cr>
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-\>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-y>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
    \ }

"<c-f>和<c-p> 在各个模式下转换
"<c-d> 使用文件名搜索代替全路径搜索
"<c-r> 使用正则模式
"<c-j>和<c-k> 上下选择文件
"<c-t> <c-v>和<c-x> 在新的tab或者新的分割窗口打开选择的文件
"<c-n>和<c-p> 找到之前或者之后查找的字符串
"<c-y> 创建一个新的文件
"<c-z> 标记或者取消标记多个文件然后使用<c-o>打开它们"


