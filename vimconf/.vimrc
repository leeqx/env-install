let mapleader=","
let g:mapleader=","

"VUNDLE-HEADER{{
	set nocompatible
	filetype off                  " required
	"" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	"" alternatively, pass a path where Vundle should install plugins
	""call vundle#begin('~/some/path/here')

	""let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'
"}}

"customize-plugin(s) {
	"==================================================
	"PluginPack vim-indent{
		Plugin 'nathanaelkane/vim-indent-guides'	
		"Auto open
		let g:indent_guides_enable_on_vim_startup = 1
		let g:indent_guides_auto_colors = 0
		let g:indent_guides_guide_size  = 1
		let g:indent_guides_start_level = 2
		autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=yellow ctermbg=3
		autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
	"}
	"PluginPack undo-tree{
	" :undolist   to show unto-tree
		Plugin 'sjl/gundo.vim'
	"}
	"modify by liqingxin------begin
	"PlugPack git-nerdtree{
	"nerdtree also need
		Plugin 'Xuyuanp/nerdtree-git-plugin'
		let g:NERDTreeUseSimpleIndicator = 1
	"}
	
	"PlugPack gitgutter{
		Plugin 'airblade/vim-gitgutter'	
		"turn on default
		let g:gitgutter_enabled = 1
		let g:gitgutter_highlight_lines = 1
	"}
	"PlugPack powerline{
		Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
		"Plugin 'kaltog/vim-powerline'
		set laststatus=2
		set showtabline=2 " Always display the tabline, even if there is only one tab
		set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
		let g:Powerline_symbols='unicode'
	"}
	"
	"PlugPack nerdtree {
		Plugin 'scrooloose/nerdtree'
		"nmap wm :NERDTreeToggle<cr>
		nmap <S-w> :NERDTreeToggle<cr>
		" auto open nerdtree
		" open vim without file and auto open nerdtree
		autocmd VimEnter * NERDTree
		autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	"	}
	"	PlugPack tagbar {
		"	Plugin 'majutsushi/tagbar'
		"	let g:tagbar_ctags_bin="/usr/local/bin/ctags"
		"	let g:tagbar_width=30
		"	nmap tag :TagbarToggle<cr>
		"	nmap <S-t> :TagbarToggle<cr>
		"	autocmd FileType h,hpp,c,cc,cxx,cpp,lua,py,java TagbarOpen
		"	set tags+=tags
	""	}
	"
	"modify by liqingxin------end
	"==================================================
	"PluginPack a.vim {
		Plugin 'vim-scripts/a.vim'
	"}
	"PlugPack airline {
		"Plugin 'bling/vim-airline'
		"let g:airline#extensions#tabline#enabled = 1
		"let g:airline#extensions#tabline#show_buffers = 1
		"let g:airline#extensions#tabline#show_tab_type = 1
		"let g:airline#extensions#tabline#buffer_idx_mode = 1
	"}
	"PlugPack easymotion "{
		Plugin 'Lokaltog/vim-easymotion'
		map  <Leader>/ <Plug>(easymotion-sn)
		omap <Leader>/ <Plug>(easymotion-tn)
		map  <Leader>n <Plug>(easymotion-next)
		map  <Leader>N <Plug>(easymotion-prev)
		map <Leader>j <Plug>(easymotion-j)
		map <Leader>k <Plug>(easymotion-k)
		let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
	"}
	"PlugPack ctrlp {
		Plugin 'kien/ctrlp.vim' 
		let g:ctrlp_map = '<c-p>'
		let g:ctrlp_cmd = 'CtrlP'
		set wildignore+=*.so,*.swp,*.zip,*.o,*.bin
		nmap mix :CtrlPMixed<cr>
	"}
	"PlugPack snpimate {
		Plugin 'garbas/vim-snipmate' 
		Plugin 'MarcWeber/vim-addon-mw-utils'
		Plugin 'tomtom/tlib_vim'
	""""Plugin 'honza/vim-snippets'
	"}
	"PlugPack markdown {
		Plugin 'godlygeek/tabular'
		Plugin 'plasticboy/vim-markdown'
		let g:vim_markdown_initial_foldlevel=2
	"}
	Plugin 'mhinz/vim-signify' "version-control
	"TODO need to install auto-complete-plug {
	Plugin 'Shougo/neocomplcache.vim'
	""------YouCompleteMe
	"Plugin 'Valloric/YouCompleteMe'
	"}
	"
	" Add by liqingxin 2015/05/17
	"PlugPack fugitive{
		Plugin 'tpope/vim-fugitive'
	"}
	"PlugPack sparkup{
		Plugin 'rstacruz/sparkup',{'rtp':'vim/'}
	"}
	"PlugPack rails {
		Plugin 'tpope/vim-rails.git'
	"}
	"PlugPack taglist {
		Plugin 'taglist.vim'
	"}
	"PlugPack SuperTab {
		Plugin 'SuperTab'
	"}
	"
	"PlugPack multiple {
		Plugin 'terryma/vim-multiple-cursors'
		" Default mapping
		 let g:multi_cursor_start_key='<C-m>'
		 let g:multi_cursor_start_word_key='g<C-m>'
		 let g:multi_cursor_next_key='<C-n>'
		 let g:multi_cursor_prev_key='<C-p>'
		 let g:multi_cursor_skip_key='<C-x>'
		 let g:multi_cursor_quit_key='<Esc>'
	"}
	
	"add by liqingxin
	"src explorer:git clone https://github.com/wesleyche/SrcExpl.git
	""""""""""""""""""""for SourceExplorer plugin""""""""""""""""""""""""".
	"PluginPack srcexpl {
		Plugin 'wesleyche/SrcExpl' 
		"
		"auto open srcexpl
		autocmd VimEnter * SrcExplToggle
		"" // The switch of the Source Explorer 
		"nmap se :SrcExplToggle<CR>
		nmap <S-E> :SrcExplToggle<CR> 
		" // Set the height of Source Explorer window 
		 let g:SrcExpl_winHeight = 12 
		" " // Set 100 ms for refreshing the Source Explorer 
		 let g:SrcExpl_refreshTime = 50 
		" " // Set "Enter" key to jump into the exact definition context 
		" let g:SrcExpl_jumpKey = "<ENTER>" 
		" " // Set "Space" key for back from the definition context 
		" let g:SrcExpl_gobackKey = "<SPACE>" 
		"
		" " // In order to avoid conflicts, the Source Explorer should know what
		" plugins
		" " // except itself are using buffers. And you need add their buffer names
		" into
		 " // below listaccording to the command ":buffers!"
		 let g:SrcExpl_pluginList = [ 
				 \ "__Tag_List__", 
				 \ "_NERD_tree_", 
				 \ "Source_Explorer" 
			 \ ] 
		"
		" " // Enable/Disable the local definition searching, and note that this is
		" not 
		" " // guaranteed to work, the Source Explorer doesn't check the syntax for
		" now. 
		" " // It only searches for a match with the keyword according to command 'gd' 
		 let g:SrcExpl_searchLocalDef = 1 
		"
		" " // Do not let the Source Explorer update the tags file when opening 
		 let g:SrcExpl_isUpdateTags = 0 
		"
		" " // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files'
		" to 
		" " // create/update the tags file 
		"let g:SrcExpl_updateTagsCmd = "ctags -aBd ." 
		 let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R . --fields=+iaS --extra=+q" 
		"let g:SrcExpl_updateTagsCmd= "ctags --sort=yes --fields=+iaS --extra=+q -R -f /home/liqingxin/project/systags . /usr/local/xl-dev-env/2nd/* /usr/local/xl-dev-env/3rd/*"
		"set tags+=/home/liqingxin/project/systags

		" " // Set "<F12>" key for updating the tags file artificially 
		"let g:SrcExpl_updateTagsKey = "<F12>" 
		 let g:SrcExpl_updateTagsKey = "<S-u>" 
		"
		" " // Set "<F10>" key for displaying the previous definition in the jump list 
		 let g:SrcExpl_prevDefKey = "<C-k>" 
		"
		" " // Set "<F11>" key for displaying the next definition in the jump list 
		 let g:SrcExpl_nextDefKey = "<C-l>" 
		 "jum to jump to definition 
		 nmap <C-j> <C-W>j:call g:SrcExpl_Jump()<CR>
		 "jump back to last windows
		 nmap <C-b> :call g:SrcExpl_GoBack()<CR>
	"add end!
"}


"VUNDLE-FOOTER{{

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on                    " required on vim7.3??
"}}







"common-setting{{
set fileencoding=utf-8
"" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4


"" folding config
set foldenable
set foldcolumn=2
set foldmethod=syntax
set foldlevel=10
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>
autocmd BufNewFile,BufRead *.vimrc set foldmarker={,} foldmethod=marker foldlevel=1

set ruler
set nu
set laststatus=2
au InsertEnter * hi StatusLine  ctermbg=201
au InsertLeave * hi StatusLine ctermbg=4
set statusline=%f%([%{Tlist_Get_Tag_Prototype_By_Line()}]%)[Line:%l/%L,Column:%c][%p%%]
set statusline=%f[Line:%l/%L,Column:%c][%p%%]

set guifont=Bitstream_Vera_Sans_Mono:h12:cANSI
set viminfo+=!

"add highlighting for function definition in C++
function! EnhanceCppSyntax()
    syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
    hi def link cppFuncDef Special
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()

"}}

"Feature 'cs' Review-And-Replace while searching (or use vim7.4:cgn ){{
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
"}}

"color-schemes{
"""---selected colorschemes---"""
	""-- blacklight busierbee 
	""-- holokai hornet iceberg jellybeans
	""-- molokai monokain Monokai
	""-- lucius Tomorrow up zenburn herokudoc 
	""-- C64 greenvision
	set t_Co=256
	color molokai "jellybeans
	"color jellybeans
	set guifont=Consolas:h15
	"autocmd FileType md,mkd color lucius
"}

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for colors jellybeans
let g:jellybeans_overrides = {
			\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
			\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
			\              'attr': 'bold' },
			\}

nmap tN :tabnew<cr>
nmap tC :tabclose<cr>
nmap tp :tabp<cr>
nmap tn :tabn<cr>
nmap <Leader>bn :bn<cr>
nmap <Leader>bp :bp<cr>

