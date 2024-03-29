"Opciones básicas
set autoindent
set autoread
set autowrite
set autowriteall
set backspace=2
set nocindent
set expandtab
set incsearch
set mouse=
set nocompatible
set noswapfile
set nowrap
set number
set re=0
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

"Formateado de código
map ff :Neoformat<cr>

"Atajo para copiar y pegar en el clipboard del sistema
vnoremap <leader>y "+y
map <leader>Y "+gP


"Permite editar el archivo .vimrc pulsando ,m
map ,m :e ~/.vimrc<CR>

"Haciendo que ESC sea inmediato
set timeoutlen=1000 ttimeoutlen=0

"Define a fish como el shell predeterminado
"set shell=fish

"Permite pulsar "gf" en lineas tipo import X from 'FILE'
let g:vim_npr_file_types = ["js", "jsx", "css", "coffee", "ts"]

"Colorea todos los strings que parecen html
let g:htl_all_templates = 1

" Plugins
call plug#begin('~/.vim/plugged')


  "LSP para vim
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'

  "Autocompletado con LSP
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'

  "Poder ver el contexto de un código
  "(desactivado por omisión, se activa con <leader>ct)
  Plug 'wellle/context.vim'

  "Plugins para svelte"
  Plug 'evanleck/vim-svelte'
  Plug 'pangloss/vim-javascript'
  Plug 'HerringtonDarkholme/yats.vim'

  "Contexto de archivos
  Plug 'Shougo/context_filetype.vim'


  "Permite saltar entre símbolos
  Plug 'pechorin/any-jump.vim'

  "Soporte svelte
  Plug 'evanleck/vim-svelte', {'branch': 'main'}

  "Wiki para vim
  Plug 'vimwiki/vimwiki'

  "Soporte para typescript
  Plug 'leafgarland/typescript-vim'

  "Soporte para chequeos gramaticales
  Plug 'rhysd/vim-grammarous'

  "Temas
  Plug 'kyoz/purify', { 'rtp': 'vim' }
  Plug 'dracula/vim', { 'as': 'dracula' }

  "Permite unir o separar bloques en varias lineas.
  Plug 'AndrewRadev/splitjoin.vim' 

  "Colores en css
  Plug 'ap/vim-css-color'

  "Resaltado de sintaxis para scripts de fish
  Plug 'dag/vim-fish'

  "Busqueda en todo el proyecto por palabras
  Plug 'dyng/ctrlsf.vim' 

  "Permite comentar bloques.
  Plug 'preservim/nerdcommenter' 

  "Hace que se resalten los tags html
  Plug 'valloric/MatchTagAlways' 

  "Permite extender la funcionalidad de %
  Plug 'adelarsq/vim-matchit'

  "Fuzzy finder.
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  "Señala las lineas modificadas.
  Plug 'airblade/vim-gitgutter'

  "Agrega soporte para git.
  Plug 'tpope/vim-fugitive'

  "Navegador de archivos
  Plug 'lambdalisue/fern.vim'

  "Señala el estado de los archivos en git
  Plug 'lambdalisue/fern-git-status.vim' 

  "Ember
  Plug 'joukevandermaas/vim-ember-hbs' 

  "Permite maximizar o restaurar un panel
  Plug 'szw/vim-maximizer' 

  "Mejora el plegado de código.
  Plug 'pseewald/vim-anyfold'

  "Prettier
  Plug 'prettier/vim-prettier', {'do': 'yarn install', 'branch': 'release/0.x' }

  "Prueba
  Plug 'Shougo/context_filetype.vim'

  "Autocompleta pulsado tab
  Plug 'ervandew/supertab'

  "Traduccion de textos
  Plug 'voldikss/vim-translator'

  "Colorea código html dentro de strings
  Plug 'jonsmithers/vim-html-template-literals'
  Plug 'leafgarland/typescript-vim'

  "Tema de color monokai
  Plug 'sickill/vim-monokai'

call plug#end()


let g:svelte_preprocessors = ['typescript']


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

"Corrección ortografica
noremap <leader>S :GrammarousCheck --lang=es<CR>
noremap <leader>A :GrammarousReset<CR>


"Manejo de splits
map <leader>q <c-w>q
map <leader>j <c-w>j
map <leader>k <c-w>k
map <leader>h <c-w>h
map <leader>l <c-w>l
map <leader>s <c-w>s
map <leader>v <c-w>v


"Mostrar el arbol de archivos
map <silent> <leader>\ :Fern . -reveal=% -drawer -toggle -width=50<CR>

"Permite desplazarse más rápido
nnoremap <C-j> <c-d>
nnoremap <C-k> <c-u>

"Plegado de código
map <leader>1 :set foldlevel=0<CR>
map <leader>2 :set foldlevel=1<CR>
map <leader>3 :set foldlevel=2<CR>
map <leader>4 :set foldlevel=3<CR>
map <leader>5 :set foldlevel=999<CR>

"Alterna maximizado del panel
let g:maximizer_set_default_mapping = 0
map <leader>a :MaximizerToggle<CR>


"Busqueda en el contenido de los archivos
nnoremap <leader>f :Rg 
nnoremap <leader>F :CtrlSF <c-r>=expand("<cword>")<cr>
nnoremap <leader>e :Rg <C-R><C-W><CR>

"Permite saltar entre cambios
nmap <c-h> :GitGutterPrevHunk<CR>

"Permite saltar entre cambios
nmap <c-l> :GitGutterNextHunk<CR>

"Permite hacer búsquedas rápidas
map <silent> <leader>p :FZF<CR>
map <silent> <leader>o :GitFiles?<CR>

map <silent> <leader>P :FZF ~/proyectos/vimwiki<CR>

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


"Agrega soporte para truecolor
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"Define el tema de colores

let g:wtf_pedantic_guicolors = 1
"colorscheme onedark
"colorscheme wtf
"colorscheme purify
let g:dracula_italic = 0
colorscheme dracula

"Para dracula, es mejor un fondo más oscuro.
highlight Normal ctermbg=NONE guibg=NONE


"Abreviaturas
iab __ipdb. import ipdb; ipdb.set_trace()
iab __pdb. import pdb; pdb.set_trace()
iab __html5 <!DOCTYPE html><CR> <html><CR> <head><CR> <script type="text/javascript" src=""></script><CR> <link rel="stylesheet" href=""><CR> </head><CR> <body><CR> </body><CR> </html><CR>
iab __debugger from remote_pdb import RemotePdb; RemotePdb('127.0.0.1', 4444).set_trace()


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
let g:SuperTabDefaultCompletionType = "<c-p>"
set completeopt=menuone,noinsert
set pumheight=8


"Siempre de deja un espacio para los signos del linter.
set signcolumn=yes

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

"Evitar que git-gutter agregre mapeos de teclado
let g:gitgutter_map_keys = 0

let g:ft = ''

highlight LineNr ctermfg=red guifg=#75419A

" Hacer que las palabras separadas con guiones se tomen como una sola palabra.
set iskeyword+=-
nnoremap <leader>w :w<CR>

map ttn vi":'<,'>TranslateR --target_lang=en<cr>
map tte vi":'<,'>TranslateR --target_lang=es<cr>
map ttp vi":'<,'>TranslateR --target_lang=pt<cr>

map RR i```<ESC>

map <leader>u :tabedit ~/tareas-para-hacer.md<cr>

:map <shift><leader><leader> :set invhlsearch<cr>
:map <leader><leader> :w<cr>


"Configuración de vimwiki
let g:vimwiki_list = [
      \ {
        \ 'path': '~/proyectos/vimwiki/', 
        \ 'path_html': '~/public_html/'
      \ }]

"Evita ocultar caracteres en vimwiki
let g:vimwiki_conceallevel = 0

"Cambia el estilo de los links en vimwiki (quita subrayado y aplica un color
"diferente)
hi! def link VimwikiLink Keyword

"Muestra los tabs
set list
set listchars=tab:--→

"Desactiva el mapeo de teclado de anyjump
let g:any_jump_disable_default_keybindings = 1
nnoremap <leader>J :AnyJump<CR>
nnoremap <leader>O :AnyJumpLastResults<CR>


"Configuración para hacer que se puedan usar
"distintas sintaxis en los archivos
if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
  endif

let g:context_filetype#filetypes.svelte =  [ {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'}, { 'filetype': 'typescript', 'start': '<script\%( [^>]*\)\?  \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>', 'end': '',  },  {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'}, ]
let g:ft = ''

"Haciendo que se puedan marcar checkboxs con vimwiki
map <leader>t <Plug>VimwikiToggleListItem

"Desactiva context por omisión
let g:context_enabled = 0
map <leader>ct :ContextToggle<cr>




map <leader>m :0r!crear-entrada-en-worklog<cr><esc>

map <leader>- o----- ✂ ----- ✂ ----- ✂ ----- ✂ -----<cr><esc>

"Desactivo auto-completado automático
let g:asyncomplete_auto_popup = 0
let g:lsp_signature_help_enabled = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"Para insertar indentación o auto-completar cuando se pulsa la tecla tab.
"inoremap <silent><expr> <TAB>
"\ pumvisible() ? "\<C-n>" :
"\ <SID>check_back_space() ? "\<TAB>" :
"\ asyncomplete#force_refresh()
  
"Para navegar con tab (o shift-tab) en el menú de auto-completado
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '!'}
let g:lsp_diagnostics_signs_hint = {'text': '?'}
let g:lsp_diagnostics_highlights_enabled = 0



nmap <leader><enter> :LspDefinition<cr>
"nmap <backspace> <c-o>
"nmap rr :LspRename<cr>
"
set nohlsearch

"ir al ticket de gira
map gt :!open https://mercadolibre.atlassian.net/browse/<c-r>=expand("<cword>")<CR><CR>

autocmd FileType vimwiki setlocal textwidth=60

map <leader>n :r!pegar-imagen %<cr>


"Genera el indice de entradas del diario automáticamente.
autocmd BufEnter diary.wiki :VimwikiDiaryGenerateLinks

"Repite el comando anterior
map rr :!!<CR>

"Ejecuta la linea de código actual
map <leader>r :exec '!'.getline('.')<CR>


"Mostrar los trailing whitespaces
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/


"hace el que clipboard sea compartido entre vim y el sistema.
set clipboard=unnamed

au BufNewFile,BufRead *.markdown set filetype=markdown
set spelllang=es
