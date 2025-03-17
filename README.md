# Config folder for NeoVim

Support for Ubuntu/Linux and MacOS (See the branches)

The branch main is for Ubuntu.

## Additional configuration

Must have the `TEMPLATE_PATH` environment variable.

## Clang LSP config

If for any reason you get errors compiling cpp files in LSP
Create a file `~/.config/clangd/config.yaml`

And paste this:

```
CompileFlags:
  Add: [-std=gnu++2b, -I/usr/include/c++/11, -I/usr/include/x86_64-linux-gnu/c++/11, -I/usr/include]
```

You may replace the `11` to your GCC version.
