#!/bin/bash
modprobe -r nvidia
modprobe -r nvidia_uvm
modprobe -r nvidia_modeset
tee /proc/acpi/bbswitch <<< OFF
