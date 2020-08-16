"Activa opciones básicas
set nocompatible
set noswapfile

"Permite editar el archivo .vimrc pulsando ,m
map ,m :e ~/.vimrc<CR> 

"Se asegura de actualizar vimrc ante cada cambio
au! BufWritePost .vimrc so %

call plug#begin('~/.vim/plugged')

  Plug 'joshdick/onedark.vim'

  "Permite comentar bloques
  Plug 'preservim/nerdcommenter'

  "Modo no distracción, se activa con :Goyo
  Plug 'junegunn/goyo.vim'

  "Fuzzy finder
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  "Señala las lineas modificadas y agrega soporte para git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  "Coloreado de sintaxis semántico
  Plug 'jaxbot/semantic-highlight.vim'

  "Autocompletado
  Plug 'neoclide/coc.nvim'

  "Navegador de archivos
  Plug 'preservim/nerdtree'

  "Ember
  Plug 'joukevandermaas/vim-ember-hbs'

  "Repetir en selecciones visuales
  Plug 'inkarkat/vim-visualrepeat'

call plug#end()

"Instalando extensiones para autocompletar código JavaScript y TypeScript.
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-python']

"Solo actualiza las lineas modificadas en git cuando guarda un archivo
autocmd BufWritePost * GitGutter

"Configuración general
set backspace=2
set wildmenu
set mouse=a
set noswapfile
set shiftwidth=2
set expandtab

"Activa la numeración de lineas
set number

"Desactiva el ajuste de lineas
set nowrap

"ATAJOS DE TECLADO
"=================

"Permite guardar con CMD+s
map s :w<CR>
imap s <ESC>:w<CR>i

"Comentar usando CMD-/
vmap / <Plug>NERDCommenterToggle
nmap / <Plug>NERDCommenterToggle

"Mostrar el arbol de archivos
map \ :NERDTreeToggle<CR>


"Permite navegar por tabs
noremap <D-1> :tabn 1<CR>
noremap <D-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>

"Permite saltar entre cambios
nmap <D-k> :GitGutterPrevHunk<CR>
nmap <D-j> :GitGutterNextHunk<CR>

"Permite hacer búsquedas rápidas
map p :GitFiles<CR>
map m :GitFiles -m<CR>
map o :Files<CR>

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


