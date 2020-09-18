#!/usr/bin/env python3

"""
Basic CPU & Memory Usage for Tmux
Author: Zaiste! <oh@zaiste.net>
Dash-meter inspired by tmux-mem-cpu
and code from psutil top.py.
From https://github.com/zaiste/tmuxified
Changes by Tony Narlock <tony@git-pull.com> at
https://github.com/tony/tmux-config.
"""

import os
import sys
if os.name != 'posix':
        sys.exit('platform not supported')
import psutil


def info():
    mem = psutil.virtual_memory()
    load = psutil.getloadavg()
    numCPUs = psutil.cpu_count()
    loadAverage = [ x / numCPUs * 100 for x in load]
    freq = psutil.cpu_freq()

    line = "%.1f/%.1fGB %.0f%%(%sHz) %.0f|%.0f|%.0f" % (
        float(mem.used / 1024. / 1024 / 1024),
        float(mem.total / 1024. / 1024 / 1024),
        psutil.cpu_percent(interval=1),
        str(int(freq.current)),
        loadAverage[0],
        loadAverage[1],
        loadAverage[2],
    )

    return line

def main():
    try:
        print(info())
    except (KeyboardInterrupt, SystemExit):
        pass

if __name__ == '__main__':
    main()
