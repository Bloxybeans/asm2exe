# asm2exe

A simple command-line tool to convert Assembly source files into windows executable programs.

## Description

`asm2exe` is a utility that takes an assembly language source file as input and produces an executable file. This tool is designed to provide a straightforward way to compile and link assembly code for rapid development and testing.

## Features

* Converts Assembly source files (`.asm`) to executable files (e.g., `.exe`).
* Supports specifying an optional output filename for the executable.
* Provides basic error handling for file operations.

### Setup

1. Place the `asm2exe.exe` file in a directory that is accessible from your system's PATH.
2. Ensure the directory containing `asm2exe.exe` is added to your system's PATH environment variable.

### Usage

```bash
asm2exe <input.asm> [output.exe]
