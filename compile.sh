#!/bin/sh

make LOCALVERSION= -j12 && \
echo "\n\nKERNEL COMPILED" && sleep 2 && \
doas make INSTALL_MOD_STRIP=1 modules_install && \
echo "\n\nMODULES INSTALLED" && sleep 2 && \
# doas mkinitcpio -p linux-strip && \
doas cp arch/x86/boot/bzImage /boot/vmlinuz-linux-strip && \
doas cp arch/x86/boot/bzImage /boot/efi/EFI/artix/vmlinuz-linux-strip && \
echo "\n\nKERNEL INSTALLED" &&
notify-send "NEW KERNEL INSTALLED"
