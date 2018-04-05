" All of them, for testing purpose
let g:evervim_bundle_groups=[
            \ 'general',
            \ 'appearance',
            \ 'writing',
            \ 'youcompleteme',
            \ 'programming',
            \ 'python',
            \ 'javascript',
            \ 'typescript',
            \ 'html',
            \ 'misc',
            \ 'go',
            \ 'rust',
            \ 'cpp',
            \ 'lua',
            \ 'css',
            \ 'd',
            \ 'r',
            \ 'dart',
            \ 'elixir',
            \ 'fsharp',
            \ 'haskell',
            \ 'html',
            \ 'java',
            \ 'latex',
            \ 'matlab',
            \ 'php',
            \ 'ruby',
            \ 'scala',
            \ 'swift'
            \ ]

" Color Theme
" If it's beyond dusk, I use dark theme.
" Other wise, a lighter theme will be chosen.
let g:evervim_color_theme="dracula"
let g:evervim_airline_theme="dracula"

" Fonts
if WINDOWS()
    let g:evervim_font="Knack NF"
else
    let g:evervim_font="Knack Nerd Font Mono"
endif
let g:evervim_font_size = "13"

" Fast Escape
imap jj <Esc>
imap kk <Esc>

" Header constants for generating and updating the comment header
let g:header_field_author = 'LER0ever'
let g:header_field_author_email = 'etasry@gmail.com'

" Enable smooth scrolling
let g:evervim_smooth_scrolling = 1

let g:evervim_no_autoformat = 1

" Hybrid Linenumber
let g:evervim_hybrid_linenumber = 1

" 80 Column Warning
" Shows a magenta line at column 81 only for those lines that exceeds 80
let g:evervim_80_column_warning = 1

" Rustup path for Racer-based completion
if !WINDOWS()
    let g:ycm_rust_src_path = "/home/everette/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
endif
