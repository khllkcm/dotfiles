#!/bin/bash
modprobe -r nvidia
modprobe -r nvidia_uvm
tee /proc/acpi/bbswitch <<< OFF
