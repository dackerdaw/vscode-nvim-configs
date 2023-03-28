" TODO there is a more contemporary version of this file
"VSCode
function! s:split(...) abort
    let direction = a:1
    let file = a:2
    call VSCodeCall(direction == 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
    if file != ''
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction

function! s:splitNew(...)
    let file = a:2
    call s:split(a:1, file == '' ? '__vscode_new__' : file)
endfunction

function! s:closeOtherEditors()
    call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction

function! s:manageEditorSize(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to == 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
    endfor
endfunction

command! -complete=file -nargs=? Split call <SID>split('h', <q-args>)
command! -complete=file -nargs=? Vsplit call <SID>split('v', <q-args>)
command! -complete=file -nargs=? New call <SID>split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew call <SID>split('v', '__vscode_new__')
command! -bang Only if <q-bang> == '!' | call <SID>closeOtherEditors() | else | call VSCodeNotify('workbench.action.joinAllGroups') | endif

nnoremap <silent> <C-w>s :call <SID>split('h')<CR>
xnoremap <silent> <C-w>s :call <SID>split('h')<CR>

nnoremap <silent> <C-w>v :call <SID>split('v')<CR>
xnoremap <silent> <C-w>v :call <SID>split('v')<CR>

nnoremap <silent> <C-w>n :call <SID>splitNew('h', '__vscode_new__')<CR>
xnoremap <silent> <C-w>n :call <SID>splitNew('h', '__vscode_new__')<CR>


nnoremap <silent> <C-w>= :<C-u>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
xnoremap <silent> <C-w>= :<C-u>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>

nnoremap <silent> <C-w>> :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
xnoremap <silent> <C-w>> :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
nnoremap <silent> <C-w>+ :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
xnoremap <silent> <C-w>+ :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
nnoremap <silent> <C-w>< :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
xnoremap <silent> <C-w>< :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
nnoremap <silent> <C-w>- :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
xnoremap <silent> <C-w>- :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>

" Better Navigation for windows
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
" xnoremap <silent> <C-/> :call Comment()<CR>
" nnoremap <silent> <C-/> :call Comment()<CR>

nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>

" tabs navigation
function! s:switchEditor(...) abort
    let count = a:1
    let direction = a:2
    for i in range(1, count ? count : 1)
        call VSCodeCall(direction ==# 'next' ? 'workbench.action.nextEditorInGroup' : 'workbench.action.previousEditorInGroup')
    endfor
endfunction

command! -complete=file -nargs=? Tabedit if empty(<q-args>) | call VSCodeNotify('workbench.action.quickOpen') | else | call VSCodeExtensionNotify('open-file', expand(<q-args>), 0) | endif
command! -complete=file -nargs=? Tabnew call VSCodeExtensionNotify('open-file', '__vscode_new__', 0)
command! Tabfind call VSCodeNotify('workbench.action.quickOpen')
command! Tab echoerr 'Not supported'
command! Tabs echoerr 'Not supported'
command! -bang Tabclose if <q-bang> ==# '!' | call VSCodeNotify('workbench.action.revertAndCloseActiveEditor') | else | call VSCodeNotify('workbench.action.closeActiveEditor') | endif
command! Tabonly call VSCodeNotify('workbench.action.closeOtherEditors')
command! -nargs=? Tabnext call <SID>switchEditor(<q-args>, 'next')
command! -nargs=? Tabprevious call <SID>switchEditor(<q-args>, 'prev')
command! Tabfirst call VSCodeNotify('workbench.action.firstEditorInGroup')
command! Tablast call VSCodeNotify('workbench.action.lastEditorInGroup')
command! Tabrewind call VSCodeNotify('workbench.action.firstEditorInGroup')
command! -nargs=? Tabmove echoerr 'Not supported yet'

AlterCommand tabe[dit] Tabedit
AlterCommand tabnew Tabnew
AlterCommand tabf[ind] Tabfind
AlterCommand tab Tab
AlterCommand tabs Tabs
AlterCommand tabc[lose] Tabclose
AlterCommand tabo[nly] Tabonly
AlterCommand tabn[ext] Tabnext
AlterCommand tabp[revious] Tabprevious
AlterCommand tabr[ewind] Tabrewind
AlterCommand tabfir[st] Tabfirst
AlterCommand tabl[ast] Tablast
AlterCommand tabm[ove] Tabmove

nnoremap <Tab> <Cmd>call <SID>switchEditor(v:count, 'next')<CR>
xnoremap <Tab> <Cmd>call <SID>switchEditor(v:count, 'next')<CR>
nnoremap <S-Tab> <Cmd>call <SID>switchEditor(v:count, 'prev')<CR>
xnoremap <S-Tab> <Cmd>call <SID>switchEditor(v:count, 'prev')<CR>