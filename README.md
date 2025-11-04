cheatsheets created for using:

https://github.com/cheat/cheat


# Installation

## Automatic (recommended)
```bash
./install.sh
```

Requires: `yq` (install via `brew install yq`)

## Manual

1. Copy cheatsheets to `~/.config/cheat/cheatsheets/davidpangsw/`

2. Add to `~/.config/cheat/conf.yml`:
```yml
  - name: davidpangsw-0
    path: ~/.config/cheat/cheatsheets/davidpangsw/0
    tags: [ davidpangsw ]
    readonly: false

  - name: davidpangsw-1
    path: ~/.config/cheat/cheatsheets/davidpangsw/1
    tags: [ davidpangsw ]
    readonly: false
```

3. Verify:
```bash
cheat -t davidpangsw
```