# NeoVim Cheatsheet

## Normal Mode 

| Key | Action |
| y<motion> | Yank (Copy) |
| d<motion> | Delete (Cut) |
| c<motion> | Change (Delete and insert mode) |
| ~ | Change case of current character |
| g~<motion> | Change case |
| gu<motion> | Change to lowercase |
| gU<motion> | Change to uppercase |
| :set spell | Enable spell check |
| :set nospell | Disable spell check |
| zg | Add to dictionary (for spell) |
| z= | Show list of suggested spellings |
| [s | Previous spell error |
| ]s | Next spell error |
| /<pattern><CR> | Search <pattern> |
| :s/<pattern>/<substitute> | Search and substitute (replace) the first occurrence of <pattern> with <substitute> in the current line |
| :s/<pattern>/<substitute>/g | Search and substitute all occurrences of <pattern> with <substitute> in the current line |
| :s/<pattern>/<substitute>/gc | Highlight all occurrences of <pattern> in the current line and ask for each option one by one to substitute with <substitute> |
| :%s/.../.../.. | Substitute actions in the whole file instead of just the current line |
| <C-L> | Clear search highlight |
| >> | Indent towards right |
| << | Indent towards left |
| <C-O> | Go to previous position, before 'jump' |
| <C-I> | Go to next position, after 'jump' |
| :ju[mps] | Print the 'jump' list |
| <F3> | Next Buffer/Tab |
| <F2> | Previous Buffer/Tab |
| <C-B> | Toggle File Explorer |

| Key | Motion |
| repeat action key (e.g. dd, yy) | Line |
| w | Till the beginning of next word |
| e | Till the end of current word |
| b | Till the beginning of the current word |
| $ | Till the end of current line |
| 0 | Till the beginning of current line |
| ^ | Till the first non blank character of the line |
| g_ | Till the last non blank character of the line |
| ge | Till the end of previous word |
| h | Character left of the cursor |
| j | Current and next (down) line |
| k | Current and previous (up) line |
| l | (Current) Letter |
| <num><motion> | <num> times motion |
| /<key><CR> | Till the next occurrence of <key> |
| <Mouse Click> | Till the clicked position |
| gg | Till the beginning of file |
| G | Till the end of file |
| aw | A word, including a trailing or leading whitespace |
| iw | Inner word, no whitespaces |
| a[ | A [ ] block, including [ ] |
| i[ | Inner [ ] block, excluding [ ] |
| a( | A ( ) block |
| i( | Inner ( ) block |
| a< | A < > block |
| i< | Inner < > block |
| a{ | A { } block |
| i{ | Inner { } block |
| at | A tag block (e.g. <aaa>...</aaa>) |
| a" | A "quoted string" |
| i" | Inner "quoted string" |
| a' | A 'quoted string' |
| i' | Inner 'quoted string' |
| a` | A `quoted string` |
| i` | Inner `quoted string` |
| % | To the next matching item |
| [( | To previous unmatched ( |
| [{ | To previous unmatched { |
| [) | To the next unmatched ) |
| ]} | To the next unmatched } |
| ]m | To the next start of a method |
| ]M | To the next end of a method |
| [m | To the previous start of a method |
| [M | To the previous end of a method |
| [/ | To the previous start of a C comment /* |
| ]/ | To the next end of a C comment */ |

## Insert Mode 

| Key | Action |
| <C-x>s | Show menu of suggested spellings |
| <C-L> | Clear search highlight |
| <F3> | Next Buffer/Tab |
| <F2> | Previous Buffer/Tab |
| <C-B> | Toggle File Explorer |

## Visual Mode

| Key | Action |
| <motion> | Select <motion> |
