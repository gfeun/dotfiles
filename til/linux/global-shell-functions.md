# How can I define shell functions globally

Sometimes, mainly when using containers, I need to define a shell function somewhere and use it in another script.
This function could be a utility function shared across different scripts:
```sh
#!/bin/sh

my_function() {
  echo hello world
}
```

I could source the file containing the function directly in the scripts needing it but this requires knowing the file path in advance.
It also can break things if the file is sourced multiple times.

Other solutions varies depending if the shell is a login shell and what shell it is:

On a __login shell__ you can use a ~/.bashrc or a ~/.zshrc and put the function there. It will get loaded on login.

However when running a container that executes a shell script, the shell is not a login shell by default.

So on a __non login shell__:

For Bash you can use BASH_ENV environment variable and give it a path to a file that will get executed by the shell on startup.
For example `BASH_ENV="~/.bashrc"`.

Some versions of alpine shell "ash" (found in containers based of Alpine) support a similar environment variable named: ENV.
But in practice it didn't work for me.

Another option tried is to define an entrypoint script and source the needed file before.
For example:
```
#!/bin/bash

source /my_script.sh

exec "$@"
```

However this does not work because the exec spawns another process which does not inherit the sourced function.

So you can do that:
```
#!/bin/ash

source /my_script.sh

$@
```
This works if the command is not a shell.

However if the command is of the form "/bin/ash -c \"my_function\"" this will not work as the shell will not inherit the sourced function.
