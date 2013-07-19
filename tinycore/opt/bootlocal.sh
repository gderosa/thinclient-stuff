#!/bin/sh
# put other system startup commands here
loadkmap < /usr/share/kmap/qwerty/it.kmap
modprobe snd_pcm_oss
modprobe snd_mixer_oss
modprobe snd_seq_oss
alsactl restore
