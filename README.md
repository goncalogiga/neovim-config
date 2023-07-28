# neovim-config

## Quick Start

```
bash <(curl -sL https://raw.githubusercontent.com/goncalogiga/neovim-config/main/install.sh)
```

This will install the configuration saved under this repo (`config/*`) and make sure the right version of `neovim` and `nodejs` is installed.

## Troubleshooting

**It's important to run `:checkhealth`** after the first
installation, since it is almost impossible all necessary
packages are installed by default in the new machine. 

Some particular things to check out after fixing `:checkhealth` outputs:
- vim markdown preview needs `yarn`. Once installed, run `:call
  mkdp#util#install()`

Finaly, any command that does not behave like excpected will
raise an error. **The error logs are to be found uner
`:mess`**.

## Ressources

Git integration videos:
- https://www.youtube.com/watch?v=IyBAuDPzdFY (overall git workflow)
- https://www.youtube.com/watch?v=vpwJ7fqD1CE (focused on merge conflicts)

Motion Control:
- https://www.youtube.com/watch?v=qZO9A5F6BZs
