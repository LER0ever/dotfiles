" All of them, for testing purpose
let g:evervim_bundle_groups=[
            \ 'appearance',
            \ 'bash',
            \ 'cpp',
            \ 'crystal',
            \ 'css',
            \ 'd',
            \ 'dart',
            \ 'elixir',
            \ 'fsharp',
            \ 'general',
            \ 'go',
            \ 'haskell',
            \ 'html',
            \ 'java',
            \ 'javascript',
            \ 'latex',
            \ 'lua',
            \ 'matlab',
            \ 'misc',
            \ 'php',
            \ 'programming',
            \ 'python',
            \ 'r',
            \ 'ruby',
            \ 'rust',
            \ 'scala',
            \ 'swift',
            \ 'typescript',
            \ 'writing',
            \ 'youcompleteme',
            \ ]

" Color Theme
" If it's beyond dusk, I use dark theme.
" Other wise, a lighter theme will be chosen.
"let cur_hour = str2nr(strftime("%H", localtime()))
"if cur_hour > 18 || cur_hour < 8
    "let g:evervim_color_theme="dracula"
    "let g:evervim_airline_theme="dracula"
"else
    "let g:evervim_color_theme="pencil"
    "let g:evervim_airline_theme="pencil"
    "let g:evervim_light_background=1
"endif

let g:evervim_color_theme="onehalfdark"
let g:evervim_airline_theme="wombat"

" Fonts
if WINDOWS()
    let g:evervim_font="Knack NF"
else
    let g:evervim_font="FuraCode Nerd Font Mono"
endif
let g:evervim_font_size = "20"

let g:evervim_no_autoformat = 1
" Header constants for generating and updating the comment header
let g:header_field_author = 'LER0ever'
let g:header_field_author_email = 'etasry@gmail.com'

" Enable smooth scrolling
"let g:evervim_smooth_scrolling = 1

" Hybrid Linenumber
let g:evervim_hybrid_linenumber = 1

" 80 Column Warning
" Shows a magenta line at column 81 only for those lines that exceeds 80
let g:evervim_80_column_warning = 1

" Rustup path for Racer-based completion
if !WINDOWS()
    let g:ycm_rust_src_path = "/home/everette/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
endif

autocmd FileType markdown set conceallevel=0
