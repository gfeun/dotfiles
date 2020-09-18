# How can I move between locations ? Go to the previous one ? Jump back to the last ?

- Use `Ctrl-o` to go back in the location list.
- Use `Ctrl-i` to move forward in the location list (does not seem to work across files).
- Use `:jumps` to get the location list
- Use `'` followed by the number of the location obtained with `:jumps` to jump directly to it (e.g: `'10`)

This is great when moving accross files and wanting to go back, for example when going to a function declaration outside of the opened file, use `Ctrl-o` to go back to the original one.
