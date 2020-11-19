"Activa opciones básicas
set backspace=2
set cindent
set expandtab
set incsearch
set mouse=a
set nocompatible
set noswapfile
set nowrap
set number
set autowriteall
set autowrite
set relativenumber
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildmenu

filetype plugin indent on

"Atajos de teclado
let mapleader = ' '
set timeoutlen=1500

"Permite editar el archivo .vimrc pulsando ,m
map ,m :e ~/.vimrc<CR>


"Define a fish como el shell predeterminado
set shell=/usr/local/bin/fish

"Permite pulsar "gf" en lineas tipo import X from 'FILE' de node para abrir
"archivos.
let g:vim_npr_file_types = ["js", "jsx", "css", "coffee", "ts"]

" Plugins
call plug#begin('~/.vim/plugged')

  Plug 'leafgarland/typescript-vim'        "Soporte para typescript
  Plug 'joshdick/onedark.vim'              "Tema
  Plug 'liuchengxu/vim-which-key'          "Muestras los atajos personalizados
  Plug 'AndrewRadev/splitjoin.vim'         "Permite unir o separar bloques en varias lineas.
  Plug 'SirVer/ultisnips'                  "Snippets que se activa con TAB
  Plug 'dag/vim-fish'                      "Resaltado de sintaxis para scripts de fish
  Plug 'pechorin/any-jump.vim'             "NUEVO:
  Plug 'dyng/ctrlsf.vim'                   "NUEVO: Busqueda en todo el proyecto por palabras
  Plug 'preservim/nerdcommenter'           "Permite comentar bloques.
  Plug 'tpope/vim-surround'                "Permite cambiar caracteres que 'encierran' un texto.

  Plug 'valloric/MatchTagAlways'           "Hace que se resalten los tags html

  Plug 'evanleck/vim-svelte', {'branch': 'main'} "Svelte

  Plug 'RRethy/vim-illuminate'             "Añade resaltado de las palabras en las que está el cursor.
  Plug 'adelarsq/vim-matchit'              "Permite extender la funcionalidad de %
  Plug 'junegunn/fzf'                      "Fuzzy finder.
  Plug 'junegunn/fzf.vim'                  "Fuzzy finder.

  Plug 'airblade/vim-gitgutter'            "Señala las lineas modificadas.
  Plug 'tpope/vim-fugitive'                "Agrega soporte para git.
  Plug 'neoclide/coc.nvim'                 "Autocompletado
  Plug 'lambdalisue/fern.vim'              "Navegador de archivos
  Plug 'lambdalisue/fern-git-status.vim'   "Señala el estado de los archivos en git
  Plug 'joukevandermaas/vim-ember-hbs'     "Ember
  Plug 'inkarkat/vim-visualrepeat'         "Repetir en selecciones visuales
  Plug 'szw/vim-maximizer'                 "Permite maximizar o restaurar un panel
  Plug 'pseewald/vim-anyfold'              "Mejora el plegado de código.

call plug#end()


"Permite que UltSnips no conflictúe con COC
let g:UltiSnipsExpandTrigger = "<nop>"

"Instalando extensiones para autocompletar código JavaScript y TypeScript.
let g:coc_global_extensions = [
  \ 'coc-tsserver', 
  \ 'coc-ultisnips', 
  \ 'coc-json', 
  \ 'coc-python', 
  \ 'coc-svelte', 
  \ 'coc-eslint', 
  \ 'coc-prettier'
  \ ]

"Solo actualiza las lineas modificadas en git cuando guarda un archivo
autocmd BufWritePost * GitGutter

"Se asegura de actualizar vimrc ante cada cambio
au! BufWritePost .vimrc so %

"Mejoras en el plegado de código
autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_comments=1
set foldlevel=99

"ATAJOS DE TECLADO
"=================

"Alternar archivos
map <silent> <c-u> :e#<CR>

"Comentar usando CMD
vmap <leader>/ <Plug>NERDCommenterToggle
nmap <leader>/ <Plug>NERDCommenterToggle

"Mostrar el arbol de archivos
map <silent> <leader>\ :Fern . -reveal=% -drawer -toggle -width=50<CR>

"Permite desplazarse más rápido
nnoremap <C-j> <c-d>
nnoremap <C-k> <c-u>

"Plegado de código
map <leader>1 :set foldlevel=0<CR>
map <leader>2 :set foldlevel=1<CR>
map <leader>3 :set foldlevel=2<CR>
map <leader>4 :set foldlevel=999<CR>

"Alterna maximizado del panel
map <C-a> :MaximizerToggle<CR>

"Muestra la ayuda de atajos
map <silent> <leader>h :WhichKey 'f'<cr>

"Busqueda en el contenido de los archivos
map <leader>f :Rg 
map <leader>F :CtrlSF<CR>
map <leader>e :Rg <C-R><C-W><CR>

"Permite guardar con CMD+s
noremap  <C-s> :w<CR>
inoremap <silent> <C-s> <ESC>:w<CR>l

"Permite saltar entre cambios
nmap <c-h> :GitGutterPrevHunk<CR>

"Permite saltar entre cambios
nmap <c-l> :GitGutterNextHunk<CR>

"Permite hacer búsquedas rápidas
map <silent> <leader>p :GFiles --exclude-standard --others --cached<CR>
map <silent> <leader>b :GitFiles -m<CR>
map <silent> <leader>m :GitFiles?<CR>
map <silent> <leader>o :Files<CR>


"Abre gitui
map <silent> <leader>g :!gitui<CR>

"Oscurece el color de fondo del editor
let g:onedark_color_overrides = {
\ "black": {
\      "gui": "#12121B",
\      "cterm": "1235", 
\      "cterm16": "20"
\ }
\}

"let g:onedark_color_overrides = {
"\ "black": {
"\      "gui": "#16191d",
"\      "cterm": "1235", 
"\      "cterm16": "20"
"\ }
"\}

"Define el tema de colores
colorscheme onedark
set termguicolors

"Demora el resalatado de palabras idénticas
let g:Illuminate_delay = 2000

"Configuración de COC
set hidden
set nobackup
set nowritebackup
set cmdheight=2        " necesita ser 2 para mostrar errores
set updatetime=300
set shortmess+=c
set signcolumn=yes
set laststatus=2


"Abreviaturas
iab ipdb import ipdb; ipdb.set_trace()
iab debugger debugger; // eslint-disable-line


"Atajos de refactorización y navegación
xmap <leader>r  <Plug>(coc-codeaction-selected)
nmap <leader>r  <Plug>(coc-codeaction-selected)
nmap <leader>R  <Plug>(coc-codeaction)

nmap <leader>d <Plug>(coc-definition)
nmap <leader>i <Plug>(coc-implementation)
"nmap <leader>e <Plug>(coc-references)


"Define qué mostrar en la parte inferior de la pantalla.
set statusline=
set statusline+=%f
set statusline+=\ 
set statusline+=%1*                            " Color naranja
set statusline+=%{&modified?\"[+]\":\"\"}      " Marca de modificación
set statusline+=%=                             " Separador
set statusline+=%2*                            " Color blanco
set statusline+=[%l:%v]\                       " Indicador de linea y columna
set statusline+=%p                             " Porcentaje de scroll
set statusline+=﹪
set statusline+=%h

hi User1 guibg=#2A323B guifg=orange
hi User2 guibg=#2A323B guifg=white

"Define los colores de fondo para el status activo e inactivos.
hi StatusLine guibg=#2A323B guifg=white

hi StatusLineNC guibg=#2A323B guifg=darkgray

set visualbell t_vb=
set novisualbell

"Mejoras en los símbolos del arbol de archivos
let g:fern#renderer#default#collapsed_symbol = '+ '
let g:fern#renderer#default#expanded_symbol = '- '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = '  '
let g:fern#renderer#default#root_symbol = '~ '

"Preferencias para mostrar el status de git.
let g:fern_git_status#disable_ignored = 1
let g:fern_git_status#disable_untracked = 1
let g:fern_git_status#disable_submodules = 1

let $FZF_DEFAULT_OPTS .= ' --no-info'
let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

"Oculta la previsualización en FZF aunque permite habilitarla con ctrl-/
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
