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

# Implementations

[View this table with sorting](https://markdown-table.nullvoxpopuli.com/?file=https://raw.githubusercontent.com/unhighghlow/awesome-brainfuck/refs/heads/main/README.md)

--------------------------
| Name | Description | Type | Language | Author | Year |
| ---- | ----------- | ---- | -------- | ------ | ---- |
| [Original](https://aminet.net/package/dev/lang/brainfuck-2) | | Interpreter | C | Urban Müller | 1993 |
| [bff](https://github.com/apankrat/bff) | Moderately-optimizing brainfuck interpreter | Interpreter | C | Alex Pankratov | 2011 |
| [bff4](https://web.archive.org/web/20230719142919/http://mazonka.com/brainf) | Fast Brainfuck interpreter | Interpreter | C | Oleg Mazonka | 2011 |
| [bffsree](https://github.com/apankrat/bff) | Fastest in class | Interpreter | C | sree kotay | 2013 |
| [esotope-bfc](https://github.com/lifthrasiir/esotope-bfc) | The world's most optimizing Brainfuck-to-something compiler | Compiler to C | Python 2 | Kang Seonghoon | 2009 |
| [awib](https://github.com/matslina/awib) | a brainfuck compiler written in brainfuck | Compiler to i686-linux, C, Ruby, Go, Tcl, Java and Rust | Brainfuck | Mats Linander  | 2015 |
| [smolbf](https://gist.github.com/lifthrasiir/596667) [^unclear-names] | The world's smallest Brainfuck interpreter | Interpreter | C | Kang Seonghoon | 2010 |
| [Reb](https://github.com/aartaka/reb) | regex-based Brainfuck toolkit | Interpreter, Compiler to C | C | Artyom Bologov | 2024 |
| [BrainForked](https://github.com/JohnCGriffin/BrainForked/) | Fast BF interpreter in C++11 | Interpreter | C++ | John Griffin | 2020 |
| [编译器](https://www.luogu.com/article/1zm75exp) | BFCompiler |  | C | tiger2005 | 2018 |
| [none1bf](https://esolangs.org/wiki/Brainfuck_C%2B%2B_interpreter) [^unclear-names] | An optimizing brainfuck interpreter | Interpreter | C++ | None1 | 2023 |
| [bf-li](http://lvogel.free.fr/bf.html) | Fast brainfuck interpreter using GNU lightning | JIT Compiler | C | Laurent Vogel | 2011 |
| [bf-sed](http://lvogel.free.fr/bf.html) | Joke interpreter | Interpreter | Sed | Laurent Vogel | 2013 |
| [rpypkgs](https://github.com/rpypkgs/rpypkgs/blob/main/bf/bf.py) | Interpreter in RPython | Interpreter | Python 2 (RPython) | Andrew Brown & Corbin Simpson | 2024 |
| [P‴ (tritium)](https://github.com/rdebath/Brainfuck/tree/master/tritium) | This is the fastest brainfuck interpreter around | Interpreter, Compiler to C | C | rdebath | 2023 |
| [libbf](https://savannah.nongnu.org/projects/libbf) | Free BrainFuck interpreter, optimizer, compiler library | JIT Compiler | C | Even Rouault | 2006 | 
| [jitbf](https://github.com/none-None1/jitbf) | Brainfuck JIT interpreter in Python | JIT Compiler | Python | None1 | 2023 |
| [OokBF](https://zedlx.com/OokBF/ookbf-interpreter) | Run Brainfu** and Ook Applications, Here and Now! | Interpreter | Javascript | | 2023 |
| [bf2fj](https://github.com/tomhea/bf2fj) | A Brainfuck to FlipJump Compiler | Compiler to FlipJump | Python | Tom Hea | 2023 |
| [BrainFExec](https://github.com/none-None1/BrainFExec) | A BrainFuck compiler to Windows executable in C# | Compiler to x86_64-windows | C# | None1 | 2023 |
| [Sade](https://github.com/aartaka/sade) | Infinitely Optimizable Brainfuck-to-Lisp Compiler | Compiler to LISP | Common Lisp | Artyom Bologov | 2023 |
| [bfc-wilfred](https://github.com/Wilfred/bfc) [^unclear-names] | An industrial-grade brainfuck compiler | Compiler | Rust | Wilfred Hughes | 2023 |
| [bfc-muxutruk](https://github.com/Muxutruk2/bfc) [^unclear-names] | Brainfuck compiler written in rust | JIT Compiler | Rust | Muxutruk | 2025 |
| [brainfuck.nix](https://github.com/jim3692/brainfuck.nix) | Brainfuck interpreter, implemented in pure Nix | Interpreter | Nix | jim3692 | 2024 |
| [bf.sed](https://github.com/rdebath/Brainfuck/blob/master/extras/bf.sed) | A BF interpreter in SED | Interpreter | Sed | rdebath | 2015 |
| [Ha bf inter](https://www.iwriteiam.nl/Ha_bf_inter.html) [^unclear-names] | BF interpreter written in BF | Interpreter | Brainfuck | Frans Faase | 2007 |
| [bfck](https://github.com/gus-caribe/bfck) | A CLI interpreter for brainf**ck esolang written in Dart | Interpreter | Dart | Gustavo Cardoso Ribeiro | 2023 |
| [Haskell BF](https://gitlab.com/Hakerh400/haskell-projects/-/blob/master/bf/Main.hs) [^unclear-names] | Brainfuck interpreter in Haskell | Interpreter | Haskell | Hackerh400 | 2023 |
| [Scratch BF](https://scratch.mit.edu/projects/1196711936) [^unclear-names] | Brainfuck interpreter in Scratch | Interpreter | Scratch | HGDNski | 2025 |
| [Brainfuck-in-Batch](https://github.com/yyny/Brainfuck-In-Batch) | Its brainfuck in batch! | Interpreter | Batch | Jonne Ransijn | 2016 |
| [brainfuck.bat](https://gist.github.com/tnhung2011/f3ab20154b21c36fe878a47c13d68dab) | A batchfile Brainfuck interpreter | Interpreter | Batch | tnhung2011 | 2025 |
| [industrial-bf](https://github.com/sit-itmo/DoomBF/tree/master/bf/industrial-bf) | Brainfuck interpreter with advanced features | Interpreter | C | highghlow | 2025 |
| [dbfi](https://brainfuck.org/dbfi.b) | Shortest self-interpreter | Interpreter | Brainfuck | Daniel B Cristofani | 2020 |
--------------------------

# Higher level languages

- [VBF](https://vilgotanl.github.io/Bf-Transpilers/old_broken_or_scrapped/vbf/vbf_transpiler_and_interpreter/index.html) -- by VigotanL (2021)
- [BFFuck](https://esolangs.org/wiki/BFFuck) -- by None1 (2023)
- [brain](https://github.com/sunjay/brain) -- by Sunjay Varma (2017)
- [BFBASIC](https://github.com/mzattera/bfbasic) -- by Jon Ripley (2005)
- [c2bf](https://github.com/iacgm/c2bf) -- the C programming language by Ian Graham Martinez (2025)
- [Ha genbfi](https://www.iwriteiam.nl/Ha_genbfi_c.txt) [^unclear-names] (from [Ha bf inter](https://www.iwriteiam.nl/Ha_bf_inter.html)) -- by Frans Faase (2007)

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

# Editor Support
- [Vim syntax file](https://github.com/rdebath/Brainfuck/blob/master/bf.vim)

[^unclear-names]: Does not have a distinct name. The name used was chosen by me 
