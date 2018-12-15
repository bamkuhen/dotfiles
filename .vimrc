" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

""""""""""""""""""""
"基本
""""""""""""""""""""

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set ruler
"set cursorline
"set cursorcolumn
set title
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
set t_Co=256

let mapleader = ","

" swap等排除
set nowritebackup
set nobackup
set noswapfile
set noundofile

" 折りたたみ
set foldmethod=marker
" バックスペースで削除
set backspace=indent,eol,start


nmap <C-L><C-R>  :source ~/.vimrc<CR>
""""""""""""""""""""
"検索
""""""""""""""""""""
" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>


""""""""""""""""""""
" grep
""""""""""""""""""""
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
autocmd QuickfixCmdPost vimgrep copen
autocmd QuickfixCmdPost grep copen

" grep の書式を挿入
nnoremap <expr> <Space>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')
"nnoremap <expr> <Space>G ':sil grep! ' . expand('<cword>') . ' *'

""""""""""""""""""""
"ショートカット
""""""""""""""""""""
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" new Tab
"nnoremap <C-T> :tabnew<CR>

"move tab
nnoremap <C-N> gt
nnoremap <C-P> gT

"function! g:searchFunction()
"  vim /^.*function/ % | cw
"endfunction
"nnoremap <C-f> <C-u> <C-n> :call g:searchFunction()<CR>

""""""""""""""""""""
"表示関係
""""""""""""""""""""
set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " その代わり80文字目にラインを入れる

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
  " set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
  set clipboard& clipboard+=unnamedplus,unnamed 
else
  " set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00 autoselect 削除
  set clipboard& clipboard+=unnamed
endif

" スクリーンベルを無効化
set visualbell
set vb t_vb=

" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%



""""""""""""""""""""
"編集
""""""""""""""""""""
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
"set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)


""""""""""""""""""""
" カラースキーム
""""""""""""""""""""
"colorscheme murphy


""""""""""""""""""""
" tag
""""""""""""""""""""
"au BufNewFile,BufRead *.js set tags+=~/Site/express/js.tags

set tags=./.tags;
nnoremap <C-]> g<C-]>

""""""""""""""""""""
" dein 
""""""""""""""""""""
let s:dein_dir = expand('~/.cache/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !=# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir = expand('~/.vim/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy':0})
  call dein#load_toml(s:lazy_toml, {'lazy':1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

syntax on
