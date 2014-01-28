" php�¹� 		--	\+r
" php���󥿥å��� 	--	,+l

set title
syntax on
set incsearch
set t_Co=256
set hidden
"set vb t_vb=
set showcmd

set laststatus=2
"set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m

"omuni�䴰
setlocal omnifunc=syntaxcomplete#Complete

"encode
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8
colorscheme torte
"colorscheme otetsu

nmap <Space>vim :e ~/.vimrc<CR>
nmap <Space>b :ls<CR>:buffer
nmap <Space>f :edit .<CR>
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer 
nmap <Space>V :Vexplore!<CR><CR>
nmap <Space>H :sp<CR>:e ~/.vimhelp<CR>

highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

function PHPLint()
        let result = system( &ft . ' -l ' . bufname(""))
        echo result
endfunction

autocmd FileType php  :nmap ,l :call PHPLint()<CR>

source ~/.vim/ftplugin/phpmanual.vim
"source ~/.vim/plugin/googlesuggest-complete.vim
autocmd FileType php :set dictionary=~/.vim/dict/php.dict
autocmd FileType c :set dictionary=~/.vim/dict/c.dict

autocmd Filetype *    let g:AutoComplPop_CompleteOption='.,w,b,u,t,i'
autocmd FileType perl let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/perl.dict'
autocmd FileType ruby let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/ruby.dict'
autocmd FileType javascript let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'
autocmd FileType erlang let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/erlang.dict'
autocmd FileType php let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/php.dict'

let g:AutoComplPop_IgnoreCaseOption = 1

"<TAB>���䴰
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
                return "\<TAB>"
        else
                if pumvisible()
                        return "\<C-N>"
                else
                        return "\<C-N>\<C-P>"
                end
        endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}} Autocompletion using the TAB key
"current dir
"au   BufEnter *   execute ":lcd " . expand("%:p:h")

"-------------------------------------------------------------------------------
" ��������
set wrapscan   " �Ǹ�ޤǸ�����������Ƭ�����
set ignorecase " ��ʸ����ʸ��̵��
set smartcase  " ��ʸ���ǤϤ��᤿����ʸ����ʸ��̵�뤷�ʤ�
set incsearch  " ���󥯥��󥿥륵����
set hlsearch   " ����ʸ����ϥ��饤��
 
"���򤷤�ʸ����򸡺�
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"���򤷤�ʸ������ִ�
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
 
"�Խ���Υե�����ѥ��˰�ư
nmap <Space>cd :lcd %:p:h<CR>

"���ѥ��ڡ������в�
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /��/

" blogit
let blog_name='t2log'
let blogit_username='yhvh'
let blogit_password='Messatu'
let blogit_url='https://otetsu.dip.jp/blog/wp/xmlrpc.php'

let blogit_unformat='pandoc --from=html --to=rst --reference-links'
let blogit_format='pandoc --from=rst --to=html --no-wrap'


"Twitter
let twitvim_count = 40
nnoremap ,tw :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tn :<C-u>NextTwitter<CR>
nnoremap ,tp :<C-u>PreviousTwitter<CR>
nnoremap ,ts :<C-u>SearchTwitter<CR>


autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
  set nowrap
endfunction
