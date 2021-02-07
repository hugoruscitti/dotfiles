"Opciones básicas
set autoindent
set autoread
set autowrite
set autowriteall
set backspace=2
set cindent
set expandtab
set incsearch
set mouse=
set nocompatible
set noswapfile
set nowrap
set number
set re=0
set relativenumber
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
set tabstop=2
set wildmenu
set laststatus=2

filetype plugin indent on

"Atajos de teclado
let mapleader = ' '
set timeoutlen=1500

"Permite editar el archivo .vimrc pulsando ,m
map ,m :e ~/.vimrc<CR>

"Haciendo que ESC sea inmediato
set timeoutlen=1000 ttimeoutlen=0

"Define a fish como el shell predeterminado
set shell=/usr/local/bin/fish

"Permite pulsar "gf" en lineas tipo import X from 'FILE'
let g:vim_npr_file_types = ["js", "jsx", "css", "coffee", "ts"]

"Colorea todos los strings que parecen html
let g:htl_all_templates = 1

let g:ale_completion_enabled = 0

" Plugins
call plug#begin('~/.vim/plugged')

  "Soporte para typescript
  Plug 'leafgarland/typescript-vim'

  "Temas
  Plug 'joshdick/onedark.vim'
  Plug 'arzg/vim-colors-xcode'

  "Muestras los atajos personalizados
  Plug 'liuchengxu/vim-which-key'

  "Permite unir o separar bloques en varias lineas.
  Plug 'AndrewRadev/splitjoin.vim' 

  "Colores en css
  Plug 'ap/vim-css-color'

  "Snippets que se activa con TAB
  Plug 'SirVer/ultisnips'

  "Resaltado de sintaxis para scripts de fish
  Plug 'dag/vim-fish'

  "Busca símbolos rápidamente
  Plug 'pechorin/any-jump.vim' 

  "Busqueda en todo el proyecto por palabras
  Plug 'dyng/ctrlsf.vim' 

  "Permite comentar bloques.
  Plug 'preservim/nerdcommenter' 

  "Permite cambiar caracteres que 'encierran' un texto.
  Plug 'tpope/vim-surround'

  "Modo libre de distracciones
  Plug 'junegunn/goyo.vim' 

  "Hace que se resalten los tags html
  Plug 'valloric/MatchTagAlways' 

  "Permite extender la funcionalidad de %
  Plug 'adelarsq/vim-matchit'

  "Fuzzy finder.
  Plug 'junegunn/fzf'

  "Fuzzy finder.
  Plug 'junegunn/fzf.vim'

  "Señala las lineas modificadas.
  Plug 'airblade/vim-gitgutter'

  "Agrega soporte para git.
  Plug 'tpope/vim-fugitive'

  "Detección de errores y autocompletado"
  Plug 'dense-analysis/ale'

  "Navegador de archivos
  Plug 'lambdalisue/fern.vim'

  "Señala el estado de los archivos en git
  Plug 'lambdalisue/fern-git-status.vim' 

  "Ember
  Plug 'joukevandermaas/vim-ember-hbs' 

  "Repetir en selecciones visuales
  Plug 'inkarkat/vim-visualrepeat' 

  "Permite maximizar o restaurar un panel
  Plug 'szw/vim-maximizer' 

  "Mejora el plegado de código.
  Plug 'pseewald/vim-anyfold'

  "Permite alternar booleanos.
  Plug 'AndrewRadev/switch.vim'

  "Prettier
  Plug 'prettier/vim-prettier', {'do': 'yarn install', 'branch': 'release/0.x' }

  "Prueba
  Plug 'Shougo/context_filetype.vim'

  "Autocompleta pulsado tab
  Plug 'ervandew/supertab'

  "Permite traducir textos usando el comando translate-text
  Plug 'echuraev/translate-shell.vim'
  "ejemplo, seleccionar un bloque y luego :B !trans -t pt -brief
  Plug 'vim-scripts/vis'

  "Colorea código html dentro de strings
  Plug 'jonsmithers/vim-html-template-literals'
  Plug 'leafgarland/typescript-vim'

  "Tema de color monokai
  Plug 'sickill/vim-monokai'

call plug#end()

"Solo actualiza las lineas modificadas en git cuando guarda un archivo
autocmd BufWritePost * GitGutter

"Se asegura de actualizar vimrc ante cada cambio
au! BufWritePost .vimrc so %

"Mejoras en el plegado de código
autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_comments=1
set foldlevel=99

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

"Alterna booleanos
nmap tt :Switch<CR>

"Muestra la ayuda de atajos
map <silent> <leader>h :WhichKey ' '<cr>

"Busqueda en el contenido de los archivos
map <leader>f :Rg 
map <leader>F :CtrlSF<CR>
map <leader>e :Rg <C-R><C-W><CR>

"Permite guardar con CMD+s
"noremap  <C-s> :w<CR>
"inoremap <silent> <C-s> <ESC>:w<CR>l

"Permite saltar entre cambios
nmap <c-h> :GitGutterPrevHunk<CR>

"Permite saltar entre cambios
nmap <c-l> :GitGutterNextHunk<CR>

"Permite hacer búsquedas rápidas
map <silent> <leader>p :GFiles --exclude-standard --others --cached<CR>
map <silent> <leader>b :GitFiles -m<CR>
map <silent> <leader>m :GitFiles?<CR>
map <silent> <leader>o :Files<CR>

"Simplifica el paso a modo comando
nmap ; :

"Abre gitui
map <silent> <leader>g :!gitui<CR>

"Oscurece el color de fondo del editor
" (otros color para gui: "#12121B")
let g:onedark_color_overrides = {
      \ "black": {
      \     "gui": "#000000", 
      \     "cterm": "235", 
      \     "cterm16": "0" 
      \   }
      \ }

"Define el tema de colores
colorscheme onedark
set termguicolors


"Abreviaturas
iab ipdb import ipdb; ipdb.set_trace()
iab debugger debugger; // eslint-disable-line
iab html5 <!DOCTYPE html><CR> <html><CR> <head><CR> <script type="text/javascript" src=""></script><CR> <link rel="stylesheet" href=""><CR> </head><CR> <body><CR> </body><CR> </html><CR>

nmap <silent> gd :ALEGoToDefinition<CR>

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
let g:fern#renderer#default#expanded_symbol = '-  '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = '. '
let g:fern#renderer#default#root_symbol = '~ '

"Preferencias para mostrar el status de git.
let g:fern_git_status#disable_ignored = 1
let g:fern_git_status#disable_untracked = 1
let g:fern_git_status#disable_submodules = 1

let $FZF_DEFAULT_OPTS .= ' --no-info'
let g:ssyncomplete_auto_popup = 0

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

"Oculta el header 
let g:netrw_banner=0

"Autocompletado con tab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set completeopt=menuone,noinsert
set omnifunc=ale#completion#OmniFunc
set pumheight=8

"Configuración ALE
let g:ale_sign_error = '•'
let g:ale_sign_warning = '∘'

"Siempre de deja un espacio para los signos del linter.
set signcolumn=yes

let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ 'javascript': ['prettier'], 
      \ 'typescript': ['prettier']}

let g:ale_linters = {}


set nobackup
set nowritebackup

"Permite previsualizar archivos pulsando p
function! s:fern_preview_init() abort
    nmap <buffer><expr>
        \ <Plug>(fern-my-preview-or-nop)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:edit)\<C-w>p",
        \   "",
        \ )
  nmap <buffer><expr> p
        \ fern#smart#drawer(
        \   "\<Plug>(fern-my-preview-or-nop)",
        \   "u",
        \ )
endfunction

augroup my-fern-preview
  set hidden
  autocmd! *
  autocmd FileType fern call s:fern_preview_init()
augroup END


if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#filetypes = {}
endif


let g:ft = ''

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1


"Atajos a símbolos de programación

imap <c-h> {
imap <c-l> }
imap <c-j> (
imap <c-k> )

imap <c-u> <
imap <c-i> >



highlight LineNr ctermfg=red guifg=#75419A
