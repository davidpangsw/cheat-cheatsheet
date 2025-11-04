cheatsheets created for using:

https://github.com/cheat/cheat


# Configuration
1. clone this project into `~/.config/cheat/cheatsheets/`
```bash
cd ~/.config/cheat/cheatsheets/
git clone https://github.com/cheat/cheat.git davidpangsw
```

2. add configurations into `~/.config/cheat/conf.yml` (0=no sub-directory, 1=1 level of sub-directory)
```yml
...

  - name: davidpangsw-0
    path: /home/<username>/.config/cheat/cheatsheets/davidpangsw/0
    tags: [ davidpangsw ]
    readonly: false

  - name: davidpangsw-1
    path: /home/<username>/.config/cheat/cheatsheets/davidpangsw/1
    tags: [ davidpangsw ]
    readonly: false

...
```

3. check if the cheatsheets are there
```yml
cheat -t davidpangsw
```