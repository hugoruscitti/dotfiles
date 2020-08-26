"Activa opciones básicas
set nocompatible
set noswapfile
"syntax on

"Permite editar el archivo .vimrc pulsando ,m
map ,m :e ~/.vimrc<CR>

"Se asegura de actualizar vimrc ante cada cambio
au! BufWritePost .vimrc so %

"Define a fish como el shell predeterminado
set shell=/usr/local/bin/fish

let g:vim_npr_file_types = ["js", "jsx", "css", "coffee", "vue", "ts"]

call plug#begin('~/.vim/plugged')

  Plug 'joshdick/onedark.vim'

  "Permite abrir los archivos más recientes
  Plug 'pbogut/fzf-mru.vim'

  "Permite comentar bloques
  Plug 'preservim/nerdcommenter'

  "Permite cambiar caracteres que 'encierran' un texto.
  Plug 'tpope/vim-surround'

  "Modo no distracción, se activa con :Goyo
  Plug 'junegunn/goyo.vim'

  "Añade resaltado de las palabras en las que está el cursor.
  Plug 'RRethy/vim-illuminate'

  "Permite extender la funcionalidad de %
  Plug 'adelarsq/vim-matchit'

  "Fuzzy finder
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  "Señala las lineas modificadas y agrega soporte para git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  "Autocompletado
  Plug 'neoclide/coc.nvim'

  "Navegador de archivos
  Plug 'preservim/nerdtree'
  Plug 'flw-cn/vim-nerdtree-l-open-h-close'

  "Mejoras para editar archivos .vue
  Plug 'leafOfTree/vim-vue-plugin'

  "Ember
  Plug 'joukevandermaas/vim-ember-hbs'

  "Repetir en selecciones visuales
  Plug 'inkarkat/vim-visualrepeat'

  "Permite maximizar o restaurar un panel
  Plug 'szw/vim-maximizer'

  "Mejora el plegado de código.
  Plug 'pseewald/vim-anyfold'

call plug#end()

"Instalando extensiones para autocompletar código JavaScript y TypeScript.
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-python']

"Activando coloreado de sintaxis dentro de vue
let g:vim_vue_plugin_use_typescript = 1

"Solo actualiza las lineas modificadas en git cuando guarda un archivo
autocmd BufWritePost * GitGutter

"Configuración general
set backspace=2
set wildmenu
set mouse=a
set noswapfile
set shiftwidth=2
set expandtab
set incsearch
set tabstop=2
set softtabstop=2
set cindent

"Activa la numeración de lineas
set number

"Desactiva el ajuste de lineas
set nowrap

"Mejoras en el plegado de código
autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_comments=1
set foldlevel=99


"ATAJOS DE TECLADO
"=================

"Alternar archivos
map <silent> <C-u> :e#<CR>

"Guarda el buffer cuando deja de estar visible
set autowriteall
set autowrite


"Comentar usando CMD
vmap / <Plug>NERDCommenterToggle
nmap / <Plug>NERDCommenterToggle

"Mostrar el arbol de archivos
map \ :NERDTreeToggle<CR>

"Alterna maximizado del panel
map <C-a> :MaximizerToggle<CR>

"vmap <C-c> "+y

"Activa el modo Goyo
map <C-e> :Goyo<CR>

"Busqueda en el contenido de los archivos
map <C-f> :Rg 

"Permite guardar con CMD+s
noremap  <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <ESC>:w<CR>l


"Permite saltar entre cambios
nmap <C-h> :GitGutterPrevHunk<CR>

"Moverse entre ventanas o paneles más rápido
nnoremap <C-j> <c-d>
nnoremap <C-k> <c-u>

"Permite saltar entre cambios
nmap <silent> <C-l> :GitGutterNextHunk<CR>

"Permite hacer búsquedas rápidas
map <silent> <C-p> :GFiles --exclude-standard --others --cached<CR>
map <silent> <C-b> :GitFiles -m<CR>
map <silent> <C-m> :FZFMru<CR>
map <silent> <C-o> :Files<CR>

"Permite abrir gitup
map <silent> . :!gitup<CR>

"Oscurece el color de fondo del editor
let g:onedark_color_overrides = {
\ "black": {
\      "gui": "#16191d",
\      "cterm": "235", 
\      "cterm16": "0"
\ }
\}

"Define el tema de colores
colorscheme onedark
set termguicolors

"Demora el resalatado de palabras idénticas
let g:Illuminate_delay = 2000


"Configuración de COC
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes


"Permite autocompletar solamente cuando se pulsa la tecla TAB
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


"Status line
set laststatus=2

"Define qué mostrar en la parte inferior de la pantalla.
set statusline=
set statusline+=%t
set statusline+=\ 
set statusline+=%1*
set statusline+=%{&modified?\"[+]\":\"\"}
set statusline+=%=
set statusline+=\ 
set statusline+=%2*
set statusline+=%p
set statusline+=﹪
set statusline+=%h


hi User1 guibg=#2A323B guifg=orange
hi User2 guibg=#2A323B guifg=white

"Define los colores de fondo para el status activo e inactivos.
hi StatusLine guibg=#2A323B guifg=white

hi StatusLineNC guibg=#2A323B guifg=darkgray

set visualbell t_vb=
set novisualbell
