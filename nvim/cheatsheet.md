# NeoVim Cheatsheet

## Normal Mode 

| Key | Action |
| :help <term> | Shows help (documentation) about <term> |
| :w[a] | Write (Save) [all] buffer[s] |
| :q[a] | Quit [all] pane[s] |
| :wq[a] | Write and Quit |
| y<motion> | Yank (Copy) |
| d<motion> | Delete (Cut) |
| c<motion> | Change (Delete and insert mode) |
| zz | Scroll the current line to be in the center of the screen |
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
| >> | Indent towards right |
| << | Indent towards left |
| == | Auto indent |
| <y/d/c>s<motion><bracket/tag> | Insert/Delete/Change the surrounding <bracket/tag> of <motion> |
| <C-O> | Go to previous position, before 'jump' |
| <C-I> | Go to next position, after 'jump' |
| :ju[mps] | Print the 'jump' list |
| <F3> | Next Buffer/Tab |
| <F2> | Previous Buffer/Tab |
| <leader>e | Toggle File Explorer |
| <C-/> | Toggle Comment |
| <leader>ca | Add comment at the end of the current line and enter insert mode |
| <leader>cs | Comment with a pretty block format |
| **Note** | **Sessions are useful but make sure you keep NERDTree closed in a session for safe recovery** |
| :SLoad | Load a session |
| :SSave | Save a session |
| :SDelete | Delete a session |
| :SClose | Close a session |
| :mksession | Save a session in the current directory (helpful for quick session recovery with startify |
| <A-k>/<A-j> | Move current line up/down |
| <C-h>/<C-j>/<C-k>/<C-l> | Move left/down/up/right between split panes |
| <C-A-h>/<C-A-j>/<C-A-k>/<C-A-l> | Move split panes left/down/up/right |
| <C-+>/<C--> | Increase/Decrease the size of a split pane vertically |
| <C-.>/<C-,> | Increase/Decrease the size of a split pane horizontally |
| <C-0> | Reset window sizes |
| <C-`> | Open terminal below (like vscode) |
| <F8> | Toggle Tagbar |
| /// | Toggle Cursor (and toggle multi-cursor mode) |
| <C-d> | Select and start search for the word under the cursor (and toggle cursor and multi-cursor mode) *Note: n/N will select (and insert cursor in) the next/previous occurrence of the word, use q to remove cursor from that occurrence if not required* |
| <C-S-up/down> | Add cursor up/down of the current cursor (skips a line if it is not possible on that line) |

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
| <F3> | Next Buffer/Tab |
| <F2> | Previous Buffer/Tab |
| <C-/> | Insert Comment |
| <y/d/c>s<motion><bracket/tag> | Insert/Delete/Change the surrounding <bracket/tag> of <motion> |
| <A-k>/<A-j> | Move current line up/down |
| <C-h>/<C-j>/<C-k>/<C-l> | Move left/down/up/right between split panes |

## Visual Mode

| Key | Action |
| <motion> | Select <motion> |
| <C-/> | Toggle Comment |
| <leader>cs | Comment with a pretty block format |
| <y/d/c>s<motion><bracket/tag> | Insert/Delete/Change the surrounding <bracket/tag> of <motion> |
| <A-k>/<A-j> | Move selected lines up/down |
| <C-h>/<C-j>/<C-k>/<C-l> | Move left/down/up/right between split panes |
| <C-g> | Switch to Select mode |

## Terminal Mode 

| Key | Action |
| <Esc> | Go to normal mode |
| <C-\><C-n> | Go to normal mode |

## Note

* :PlugClean to clean/uninstall plugins
* :PlugInstall to install plugins
* :PlugUpdate to update plugins
* :PlugUpgrade to upgrade VimPlug itself
* :PackerClean to remove any disabled/unused plugins
* :PackerInstall to clean, then install missing plugins
* :PackerUpdate to clean, then update and install plugins
* :PackerSync to sync any changes in the plugins
* :CocInstall coc-pyright for python autocomplete
