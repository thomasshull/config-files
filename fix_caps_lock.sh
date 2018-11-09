#!/bin/bash

sudo xmodmap -e 'keycode 66 = Control_L'
sudo xmodmap -e 'clear Lock'
sudo xmodmap -e 'add Control = Control_L'
