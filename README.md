# Awesome BrainF [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

A curated list of tools relating to the brainfuck esoteric language

# Documentation

- [Original submission](https://aminet.net/package/dev/lang/brainfuck-2) -- by Urban Müller (1993)
- [Website](https://brainfuck.org)
  - [Specification](https://brainfuck.org/brainfuck.html)
  - [Epistile to the implementors](https://brainfuck.org/epistle.html)
- [Wikipedia](https://en.wikipedia.org/wiki/Brainfuck)
- [Esolang wiki](https://esolangs.org/wiki/Brainfuck)
  - [Algorithms](https://esolangs.org/wiki/Brainfuck_algorithms)
  - [Instruction Minimization](https://esolangs.org/wiki/BF_instruction_minimalization)
  - [Constants](https://esolangs.org/wiki/Brainfuck_constants)
  - [Category](https://esolangs.org/wiki/Category:Brainfuck)
  
- [50,000,000,000 Instructions Per Second : Design and Implementation of a 256-Core BrainFuck Computer](https://people.csail.mit.edu/wjun/papers/sigtbd16.pdf) by Sang-Woo Jun
- [Comparison of brainfuck compilers](https://code.google.com/archive/p/esotope-bfc/wikis/Comparison.wiki)

# Implementations

## Highlights

- [Original](https://aminet.net/package/dev/lang/brainfuck-2) -- The original interpreter
- [qdb](https://brainfuck.org/qdb.c) -- A really small and reasonably fast interpreter
- [esotope-bfc](https://github.com/lifthrasiir/esotope-bfc) -- A really good optimizing compiler to C
- [awib](https://github.com/matslina/awib) -- Cursed polyglot experiment that compiles to everything
- [dbfi](https://brainfuck.org/dbfi.b) -- A famous and tiny brainfuck meta-interpreter
- [P‴ (tritium)](https://github.com/rdebath/Brainfuck/tree/master/tritium) -- One of the fastest, and maybe the fastest interpreter (that also features a compiler to x86 assembly and C, as well as JIT)
- [industrial-bf](https://github.com/sit-itmo/DoomBF/tree/master/bf/industrial-bf) -- My own interpreter. It's not terribly fast, but does come with a nice debugger.

## Full table

[View this table with sorting](https://markdown-table.nullvoxpopuli.com/?file=https://raw.githubusercontent.com/unhighghlow/awesome-brainfuck/refs/heads/main/README.md)

<details>
<summary><b>How to run these interpreters</b></summary>

<p></p>

> I packaged many of the interpreters from this list using [nix](https://nixos.org/download/#download-nix). They are available in this repository using a flake and can be run with:
>
> ```
> nix shell git+https://codeberg.org/highghlow/awesome-brainfuck#<NAME>
> ```
> or
> ```
> nix shell github:highghlow/awesome-brainfuck#<NAME>
> ```
>
> Some interpreters have unfree licenses (or have no license, which counts as an unfree license). To run such an interpreter use:
> ```
> NIXPKGS_ALLOW_UNFREE=1 nix shell git+https://codeberg.org/highghlow/awesome-brainfuck#<NAME> --impure
> ```
> 
> You can find the identifier of an interpreter in the last column of the table
>
> You can list all interpreters available using:
> ```
> nix flake show git+https://codeberg.org/highghlow/awesome-brainfuck
> ```
</details>

<!-- BEGIN TABLE !-->
--------------------------
| Name | Description | Type | Language | Author | Year | Run |
| ---- | ----------- | ---- | -------- | ------ | ---- | --- |
| [Original](https://aminet.net/package/dev/lang/brainfuck-2) | Who can program anything useful with it? :) | Interpreter | C | Urban Müller | 1993 | `original` |
| [bff](https://github.com/apankrat/bff) | Moderately-optimizing brainfuck interpreter | Interpreter | C | Alex Pankratov | 2011 | `bff` |
| [bff4](https://web.archive.org/web/20230719142919/http://mazonka.com/brainf) | Fast Brainfuck interpreter | Interpreter | C | Oleg Mazonka | 2011 | `bff4` |
| [bffsree](http://sree.kotay.com/2013/02/implementing-brainfuck.html) | Fastest in class | Interpreter | C | sree kotay | 2013 | `packages.i686-linux.bffsree` |
| [esotope-bfc](https://github.com/lifthrasiir/esotope-bfc) | The world's most optimizing Brainfuck-to-something compiler | Compiler to C | Python 2 | Kang Seonghoon | 2009 |  |
| [awib](https://github.com/matslina/awib) | a brainfuck compiler written in brainfuck | Compiler to i686-linux, C, Ruby, Go, Tcl, Java and Rust | Brainfuck | Mats Linander  | 2015 | `awibFull` |
| [smolbf](https://gist.github.com/lifthrasiir/596667) [^unclear-names] | The world's smallest Brainfuck interpreter | Interpreter | C | Kang Seonghoon | 2010 |  |
| [Reb](https://github.com/aartaka/reb) | regex-based Brainfuck toolkit | Interpreter, Compiler to C | C | Artyom Bologov | 2024 | `reb` |
| [BrainForked](https://github.com/JohnCGriffin/BrainForked/) | Fast BF interpreter in C++11 | Interpreter | C++ | John Griffin | 2020 | `brainforked` |
| [编译器](https://www.luogu.com/article/1zm75exp) | BFCompiler |  | C | tiger2005 | 2018 | |
| [none1bf](https://esolangs.org/wiki/Brainfuck_C%2B%2B_interpreter) [^unclear-names] | An optimizing brainfuck interpreter | Interpreter | C++ | None1 | 2023 | `none1bf` |
| [bf-li](http://lvogel.free.fr/bf.html) | Fast brainfuck interpreter using GNU lightning | JIT Compiler | C | Laurent Vogel | 2011 | `packages.i686-linux.bf-li` |
| [bf-sed](http://lvogel.free.fr/bf.html) | Joke interpreter | Interpreter | Sed | Laurent Vogel | 2013 | |
| [rpypkgs](https://github.com/rpypkgs/rpypkgs/blob/main/bf/bf.py) | Interpreter in RPython | Interpreter | Python 2 (RPython) | Andrew Brown & Corbin Simpson | 2024 | |
| [P‴ (tritium)](https://github.com/rdebath/Brainfuck/tree/master/tritium) | This is the fastest brainfuck interpreter around | Interpreter, Compiler to C and x86 Assembly, JIT Compiler | C | rdebath | 2023 | `tritium` |
| [libbf](https://savannah.nongnu.org/projects/libbf) | Free BrainFuck interpreter, optimizer, compiler library | JIT Compiler | C | Even Rouault | 2006 |  |
| [jitbf](https://github.com/none-None1/jitbf) | Brainfuck JIT interpreter in Python | JIT Compiler | Python | None1 | 2023 | |
| [OokBF](https://zedlx.com/OokBF/ookbf-interpreter) | Run Brainfu** and Ook Applications, Here and Now! | Interpreter | Javascript | | 2023 | |
| [bf2fj](https://github.com/tomhea/bf2fj) | A Brainfuck to FlipJump Compiler | Compiler to FlipJump | Python | Tom Hea | 2023 | |
| [BrainFExec](https://github.com/none-None1/BrainFExec) | A BrainFuck compiler to Windows executable in C# | Compiler to x86_64-windows | C# | None1 | 2023 | |
| [Sade](https://github.com/aartaka/sade) | Infinitely Optimizable Brainfuck-to-Lisp Compiler | Compiler to LISP | Common Lisp | Artyom Bologov | 2023 | |
| [bfc-wilfred](https://github.com/Wilfred/bfc) [^unclear-names] | An industrial-grade brainfuck compiler | Compiler to LLVM IR | Rust | Wilfred Hughes | 2023 | |
| [bfc-muxutruk](https://github.com/Muxutruk2/bfc) [^unclear-names] | Brainfuck compiler written in rust | JIT Compiler | Rust | Muxutruk | 2025 | |
| [brainfuck.nix](https://github.com/jim3692/brainfuck.nix) | Brainfuck interpreter, implemented in pure Nix | Interpreter | Nix | jim3692 | 2024 | |
| [bf.sed](https://github.com/rdebath/Brainfuck/blob/master/extras/bf.sed) | A BF interpreter in SED | Interpreter | Sed | rdebath | 2015 | |
| [Ha bf inter](https://www.iwriteiam.nl/Ha_bf_inter.html) [^unclear-names] | BF interpreter written in BF | Interpreter | Brainfuck | Frans Faase | 2007 | |
| [bfck](https://github.com/gus-caribe/bfck) | A CLI interpreter for brainf**ck esolang written in Dart | Interpreter | Dart | Gustavo Cardoso Ribeiro | 2023 | |
| [Haskell BF](https://gitlab.com/Hakerh400/haskell-projects/-/blob/master/bf/Main.hs) [^unclear-names] | Brainfuck interpreter in Haskell | Interpreter | Haskell | Hackerh400 | 2023 | |
| [Scratch BF](https://scratch.mit.edu/projects/1196711936) [^unclear-names] | Brainfuck interpreter in Scratch | Interpreter | Scratch | HGDNski | 2025 | |
| [Brainfuck-in-Batch](https://github.com/yyny/Brainfuck-In-Batch) | Its brainfuck in batch! | Interpreter | Batch | Jonne Ransijn | 2016 | |
| [brainfuck.bat](https://gist.github.com/tnhung2011/f3ab20154b21c36fe878a47c13d68dab) | A batchfile Brainfuck interpreter | Interpreter | Batch | tnhung2011 | 2025 | |
| [industrial-bf](https://github.com/sit-itmo/DoomBF/tree/master/bf/industrial-bf) | Brainfuck interpreter with advanced features | Interpreter | C | highghlow | 2025 | |
| [dbfi](https://brainfuck.org/dbfi.b) | Shortest self-interpreter | Interpreter | Brainfuck | Daniel B Cristofani | 2020 | |
| [sbi](https://brainfuck.org/sbi.c) | A clean and simple, but slow brainfuck interpreter | Interpreter | C | Daniel B Cristofani | 2006 | |
| [qdb](https://brainfuck.org/qdb.c) | Quick and dirty brainfuck interpreter | Interpreter | C | Daniel B Cristofani | 2020 | |
| [bcci](https://brainfuck.org/bcci.c) | The unreasonably restrictive, score-computing interpreter used for BFCC | Interpreter | C | Daniel B Cristofani | 2004 | |
| [Visual Brainfuck for Applications](https://codeberg.org/highghlow/visual-brainfuck) | Brainfuck Interpreter in VBA | Interpreter | VBA | highghlow | 2026 | |
| [dbf2c](http://esoteric.sange.fi/brainfuck/impl/compilers/dbf2c.b) | Very simple BF-to-C compiler | Compiler to C | Brainfuck | Daniel B Cristofani | 2004 | |
| [BF2C](https://web.archive.org/web/20031207075550/http://www.brainfuck.ca/BF2C.c) [alt](https://esoteric.sange.fi/brainfuck/impl/compilers/BF2C.c) |Really simple non-optimizing compiler | Compiler to C | C | Thomas Cort | 2003 | |
| [BF2Java](https://web.archive.org/web/20031207084623/http://www.brainfuck.ca/BF2Java.c) [alt](http://esoteric.sange.fi/brainfuck/impl/compilers/BF2Java.c) | Really simple non-optimizing compiler (again) | Compiler to Java | C | Thomas Cort | 2003 | |
| [BF2X86Asm](https://web.archive.org/web/20031207100929/http://www.brainfuck.ca/BF2X86Asm.java) [alt](http://esoteric.sange.fi/brainfuck/impl/compilers/BF2X86Asm.java) | Slightly optimizing compiler | Compiler to x86 Assembly | Java | Thomas Cort | 2003 | |
| [BF2MIPSAsm](https://web.archive.org/web/20031207091510/http://www.brainfuck.ca/BF2MIPSAsm.java) [alt](http://esoteric.sange.fi/brainfuck/impl/compilers/BF2MIPSAsm.java) | Slightly optimizing compiler (again (again)) | Compiler to MIPS Assembly | Java | Thomas Cort | 2003 | |
| [bfcc](http://esoteric.sange.fi/brainfuck/impl/compilers/bfcc.c) | MS-DOS compiler | Compiler to x86-msdos | C | Ben Olmstead | 1997 | |
| [dbc](https://brainfuck.org/dbc.c) | A compiler for SUN machines | Compiler to sparc-linux | C | Daniel B Cristofani | 2004 | |
| [Hamster, the BF Compiler](https://www.hamsterfestdestiny.org/hamster/) | The world's most diverse, highly-optimizing, well-commented, and modularly designed BF compiler ever implemented | Compiler to C, Java, MIPS Assembly, x86 Assembly, LLVM IR | Scheme | Jon Simons | 2008 | |
| [bf2c.hs](https://esoteric.sange.fi/brainfuck/impl/compilers/bf2c.hs) | Brainfuck to C compiler in Haskell | Compiler to C | Haskell | Bertram Felgenhauer | 2002 | |
| [wbf2c](https://github.com/skeeto/bfc) [web](https://web.archive.org/web/20071201152418/https://nullprogram.com/projects/bf/) | Optimizing, Multi-threading Brainfuck to C Converter | Compiler to C | C | Christopher Wellons | 2008 | `wbf2c` |
| [bf-x86](https://github.com/skeeto/bf-x86) | x86_64 brainfuck compiler | Compiler to x86_64-linux | C | Christopher Wellons | 2015 | `bf-x86` |
| [bfdb](https://djm.cc/dmoews.html) | Optimizing interpreter, debugger and compiler for the BF programming language | Interpreter, Compiler to C | C | David Moews | 2006 | `bfdb` |
--------------------------
<!-- END TABLE !-->

# Higher level languages

- <sub>:star:</sub> [BFFuck](https://esolangs.org/wiki/BFFuck) -- by None1 (2023)
- <sub>:star:</sub> [VBF](https://vilgotanl.github.io/Bf-Transpilers/old_broken_or_scrapped/vbf/vbf_transpiler_and_interpreter/index.html) -- by VigotanL (2021)
- [brain](https://github.com/sunjay/brain) -- by Sunjay Varma (2017)
- [BFBASIC](https://github.com/mzattera/bfbasic) -- by Jon Ripley (2005)
- [c2bf](https://github.com/iacgm/c2bf) -- the C programming language by Ian Graham Martinez (2025)
- [Ha genbfi](https://www.iwriteiam.nl/Ha_genbfi_c.txt) [^unclear-names] (from [Ha bf inter](https://www.iwriteiam.nl/Ha_bf_inter.html)) -- by Frans Faase (2007)
- [Bfun (Pythonic)](https://github.com/ShanThatos/compile-pythonic-to-bf) -- by Shanth Koka (2024)

# Software
- [Brainfuck Enterprise Solutions](https://github.com/bf-enterprise-solutions)
  - [ed.bf](https://github.com/bf-enterprise-solutions/ed.bf) -- Infinitely configurable integrated IDE and text editor 
  - [os.bf](https://github.com/bf-enterprise-solutions/os.bf) -- A next-generation high-performance operating system focused on enterprise-level resilience
  - [str.bf](https://github.com/bf-enterprise-solutions/str.bf) -- High efficiency string manipulation in Brainfuck, re-imagined.
  - [meta.bf](https://github.com/bf-enterprise-solutions/meta.bf) -- Cutting-edge, blazing fast embeddable Brainfuck metainterpreter that is the beating heart of our resilient blade servers
- [Rdebath's collection](https://github.com/rdebath/Brainfuck)
  - [bitwidth.b](https://github.com/rdebath/Brainfuck/blob/master/bitwidth.b) -- Brainfuck torture test
  - [a lot of tests](https://github.com/rdebath/Brainfuck/tree/master/testing)
- [brainfuck.org](https://brainfuck.org)
  - [life.b](https://brainfuck.org/life.b) -- Conway's Game of Life
  - [sierpinski.b](https://brainfuck.org/sierpinski.b) -- Display Sierpinski triangle
- [mandelbrot.b](https://github.com/ErikDubbelboer/brainfuck-jit/blob/master/mandelbrot.bf) -- A mandelbrot set fractal viewer
- [Lost Kingdom](https://jonripley.com/i-fiction/games/LostKingdomBF) -- World's first Brainfuck text adventure

# IDEs
- [Vim syntax file](https://github.com/rdebath/Brainfuck/blob/master/bf.vim)
- [Braintease](https://braintease.dev) 
- [BF Designer](https://antfs10.itch.io/brainfuck-designer)

[^unclear-names]: Does not have a distinct name. The name used was chosen by me 
