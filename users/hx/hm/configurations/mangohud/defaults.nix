# - name: MANGOHUD | Install essentials on Linux
#   package:
#     name:
#       - mangohud
#       - gamemode
#     state: latest
#   become: true

# - name: MANGOHUD | Create /.config/MangoHud directory
#   file:
#     path: ~/.config/MangoHud
#     state: directory

# - name: MANGOHUD | Symlink MangoHud config
#   file:
#     src: '{{ ansible_env.PWD }}/roles/MangoHud/files/{{ item }}'
#     path: '~/.config/MangoHud/{{ item }}'
#     state: link
#     follow: yes
#     force: yes
#   loop:
#     - MangoHud.conf
