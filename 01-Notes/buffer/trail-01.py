#!/usr/bin/env python3

import os

indent_pad = ""

def traila():
    global indent_pad
    start_root = "/70-CurrentWork/frmntgh-ProjDocTree/SampleTree"
    start_root = "/70-CurrentWork/frmntgh-ProjDocTree/SampleTree/20-Plan"
    for root, _, files in os.walk(start_root):
        indent_pad += "  "
        print(f"{indent_pad}root = {root}")
        # for dir in dirs:
        #     print(f"{indent_pad}[DIR]   {dir}")
        for file in files:
            print(f"{indent_pad}[FILE]  {file}")


if __name__ == "__main__":
    traila()
