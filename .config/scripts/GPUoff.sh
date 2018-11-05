#!/bin/bash
modprobe -r nvidia_uvm
modprobe -r nvidia_modeset
modprobe -r nvidia
tee /proc/acpi/bbswitch <<< OFF
