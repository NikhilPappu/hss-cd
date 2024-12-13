let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Desktop/(p)q_crypto/research/hss-cd
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +4 low_lvl.md
badd +185 main.tex
badd +8 defn_hss_cd.tex
badd +296 macros_basic.tex
badd +31 macros_adhoc.tex
badd +242 hss-cd.tex
badd +1 ~/Desktop/(p)q_crypto/research/col_res_skl/const-CDSKE-CDec-NM.tex
badd +21 preamble_usepackages.tex
badd +19032 bib/crypto.bib
badd +1 motive.md
badd +15 preliminaries.tex
badd +1 read_group.md
badd +7 fss-cd.tex
badd +1 strong-fss.tex
badd +1 std-fss.tex
badd +1 dbo-fss.tex
badd +1 strong-fss-cd.tex
badd +1 std-fss-cd.tex
badd +1 dbo-fss-cd.tex
badd +3 full-fss-cd.tex
badd +12 fd-fss.tex
badd +1 r-fss.tex
badd +1 sl-fss.tex
badd +1 dsl.tex
badd +1 dcp.tex
badd +99 motive.tex
badd +2 stash.md
badd +217 bib/other.bib
badd +1 intro.tex
badd +1 todo.tex
argglobal
%argdel
$argadd low_lvl.md
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit dsl.tex
argglobal
balt fss-cd.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext
edit todo.tex
argglobal
balt main.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 014|
tabnext
edit stash.md
argglobal
balt dsl.tex
setlocal fdm=expr
setlocal fde=Foldexpr_markdown(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
137
normal! zo
137
normal! zo
157
normal! zo
let s:l = 223 - ((19 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 223
normal! 0
tabnext
edit macros_adhoc.tex
argglobal
balt dsl.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 55 - ((18 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 55
normal! 027|
tabnext
edit macros_basic.tex
argglobal
balt macros_adhoc.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 681 - ((28 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 681
normal! 022|
tabnext 1
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
