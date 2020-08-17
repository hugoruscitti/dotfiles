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

  "Permite maximizar o restaurar un panel
  Plug 'szw/vim-maximizer'

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
set incsearch
set tabstop=2
set softtabstop=2
set cindent

"Activa la numeración de lineas
set number

"Desactiva el ajuste de lineas
set nowrap

"ATAJOS DE TECLADO
"=================

"Permite guardar con CMD+s
noremap  <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <ESC>:w<CR>i


"Permite navegar por tabs
noremap <D-1> :tabn 1<CR>
noremap <D-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>


"Moverse entre ventanas o paneles más rápido
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>

"Permite hacer búsquedas rápidas
map <C-p> :GitFiles<CR>
map <C-m> :GitFiles -m<CR>
map <C-o> :Files<CR>

"Comentar usando CMD-/
vmap <C-/> <Plug>NERDCommenterToggle
nmap <C-/> <Plug>NERDCommenterToggle

"Mostrar el arbol de archivos
map <C-\> :NERDTreeToggle<CR>

"Alterna maximizado del panel
map <C-a> :MaximizerToggle<CR>

"Activa el modo Goyo
map <C-e> :Goyo<CR>

"Busqueda en el contenido de los archivos
map <C-f> :Rg 

"Permite saltar entre cambios
nmap <C-h> :GitGutterPrevHunk<CR>
nmap <C-l> :GitGutterNextHunk<CR>


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


"Configuración de COC
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

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

set statusline=
"set statusline+=%6*
set statusline+=%t
set statusline+=%=
set statusline+=%f
set statusline+=\ 
set statusline+=%p
set statusline+=﹪

"hi User6 ctermbg=black ctermfg=darkgray guibg=black guifg=darkgray

"Aplica coloreado de sintaxis cada vez que se guarda el archivo
let g:semanticUseCache = 1
let g:semanticPersistCache = 1
autocmd BufEnter,BufWritePre *.py :SemanticHighlight
autocmd BufEnter,BufWritePre *.js :SemanticHighlight
autocmd BufEnter,BufWritePre *.ts :SemanticHighlight
