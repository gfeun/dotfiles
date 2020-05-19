# How can I add private modules dependencies ?

Go fetches modules through a mirror on the internet by default.
This makes private modules fetch on private network fail (eg internal software forge).

To fix this: `export GOPRIVATE=your.internal.repo.com` before running go commands
