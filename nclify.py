#!/usr/bin/env python3

import re
import sys

fi = open(sys.argv[1], "rt")
fo = open(sys.argv[2], "wt")


def new_signal(old_signal, kind):
    m = re.search(r'(.*)(\[\d+\])', old_signal)
    if m:
        return m.group(1) + "_" + kind + m.group(2)
    else:
        return old_signal + "_" + kind


for line in fi:
    if line.startswith(".inputs ") or line.startswith(".outputs "):
        a = line.split()
        names = a[1:]
        new_names = []
        for name in names:
            new_names.append(new_signal(name, "t"))
            new_names.append(new_signal(name, "f"))
        fo.write(" ".join([a[0]] + new_names) + "\n")
    elif line.startswith(".subckt"):
        a = line.split()
        new_type = "NCL_" + a[1]
        new_args = []
        for arg in a[2:]:
            parts = arg.split("=")
            assert len(parts) == 2
            new_args.append(parts[0] + "_t=" + new_signal(parts[1], "t"))
            new_args.append(parts[0] + "_f=" + new_signal(parts[1], "f"))
        fo.write(" ".join([a[0], new_type] + new_args) + "\n")
    else:
        fo.write(line)

fo.close()
fi.close()
