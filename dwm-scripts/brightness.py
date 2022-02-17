#!/usr/bin/env python3

with open('/sys/class/backlight/intel_backlight/actual_brightness') as f:
    actual = f.read()
with open('/sys/class/backlight/intel_backlight/max_brightness') as f:
    total = f.read()

actual = (float(actual))
total = (float(total))
perc = actual / total

print(" " + str(int(perc*100)) + "%")
