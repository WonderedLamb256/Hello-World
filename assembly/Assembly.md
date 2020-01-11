# Assembly Language

Assembly is a group of mildly different programming languages. The concept of assembly languages was invented by Kathleen
Booth in the year 1947; this was drastically different from the next assembly languages that pioneered the modern programming
format for programming languages. It used symbols, like the division symbol, that modern assembly languages wouldn't even
recognize.

Origins
-

The first concept of a programming language was invented long, long before the first machine language. Eventually, Alan
Turing was born and proceeded to create the Turing machine in the late 30's, which would evolve into the very first form
of machine code nearly ten years later. 

Early computer scientists around this time didn't really know about the machine and rather went on their own way, creating
electric circuits and modifying them to make programs. This was where the earliest programming concepts, such as registers,
were invented.

Some computer scientists found out about the Turing machine. This was the beginning of the first programming generration. All
code was developed in these methods:

+ read from a casette tape or a paper, like Turing machine

or

+ a programming control panel in the front of the machine

The earliest options were the confusing binary and octal methods. Octal was rarely used.

These machine code/assembly samples move the number 97, 01100001b, 141o, or 61h into the AL (lower half of AX) register:
```asm
10110000b 01100001b
```
```asm
260o 141o ; GitHub's assembly reader doesn't recognize octal method
```
Next came the decimal method. This was easier to understand, and used the base 10 (human) format.
```asm
176 97 ; Decimal does not need a lettered ending
```
Next came the modern standard, hexadecimal. Binary and decimal are sometimes used though.
```asm
B0h 61h
```
Hexadecimal machine code became used frequently around the time Assembly was invented, but when it morphed into its modern form, 
it became the supreme choice:
```asm
MOV AL,61h ; MOV is the processor instruction, AL is the register 61h will be moved in, and 61h is the number placed into AL
```
However, in the 60's, people began moving to languages like ALGOL, COBOL, and FORTRAN, killing the assembly development in
apps. Assembly was still used, and the computer scientists still couldn't get rid of it. Hard truth: they never did.

The last use of Assembly to *fully* (all OSes still need it) make a vastly used (see MikeOS, it's Assembly but nobody uses it) OS was Unix at the end of the decade.

The final nail in the coffin was the mid-third generation programming language C (heavily used by the dev of this repo). Unix
was rebased on C. Eventually, the slow death of Assembly in high-level OS programming began. Then, many other languages
hammered at Assembly. C++, Basic, and some other languages also tried to fight Assembly development. OOP was invented.
Assembly is ancient and can't adapt. Even C gets some of the scoop. 

At the turn of the century, Java, Python, C, and C++ made up most of the non-web development, meaning Assembly was pretty much dead 
except for bootloaders and parts of kernels.

Now, most people who have never used many languages have never heard of this language. Assembly is used now for:

+ compilers like GCC, Clang, G++

+ bootloaders and kernel parts

+ OS development

Some modern assemblers are:

+ NASM (aka the Netwide Assembler, the most common assembler)

+ GAS/AS (GNU Assembler from Binutils)

+ MASM (Microsoft Assembler)

If you want to start learning, there are many tutorials out there. Go and try Assembly, it's easy to learn but hard to master!
