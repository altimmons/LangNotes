#! usr/bin/code

----
----
# Shell Scripting Intro
----
----

[Linux Notes](../Linux.md)
## Resources

[Bash Beginners Guide](https://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html)

[The Advanced Bash Scripting Guide](https://tldp.org/LDP/abs/html/index.html)

[SHELLdorado - Links](http://www.shelldorado.com/links/)

[Bash Commands Linuxize](https://linuxize.com/tags/terminal/)

- [GNU Bash Manual](https://www.gnu.org/manual/) - gzip archives.
- [Documentation and Examples](http://www.bashcookbook.com/bashinfo/) - bash cook book.
- [bash tips](https://www.ukuug.org/events/linux2003/papers/bash_tips/) - Configure the bash terminal.
- [Bash pitfalls](http://mywiki.wooledge.org/BashPitfalls) - GreyCat's wiki.

- [Bash Manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents)


-  http://tldp.org/LDP/abs/html/index.html
- http://www.caliban.org/bash
-  http://www.shelldorado.com/scripts/categories.html
-  http://www.dotfiles.org

> ![](http://www.shelldorado.com/images/pixel.gif)  ![](http://www.shelldorado.com/images/pixel.gif)  
> The location of these links' source page is [http://www.shelldorado.com/links/](http://www.shelldorado.com/links/)
> 
> Script Archives
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [UNIX Power Tools Book](http://www.amazon.com/exec/obidos/ASIN/1565922603/heinersshelldora/) (_Jerry D. Peek_, _Tim O'Reilly_, _Mike Loukides_) - Excellent book about UNIX shell scripting with many examples
>     -   [Archive of all shell scripts (684 KB)](ftp://ftp.ora.com/published/oreilly/power_tools/unix/upt9707.tgz)
> -   [John Chamber's Script directory](http://trillian.mit.edu/~jc/sh/) (_John Chambers_) - Large collection of more than 300 good shell scripts, well commented
>     -   [Home directory](http://trillian.mit.edu/~jc/)
> -   [ftp.armory.com](ftp://ftp.armory.com./pub/scripts/) (_John H. DuBois III_) - Archive of more than 100 scripts. They tend to be large, but well commented. Some are specific to the SCO UNIX operating system
>     -   [Short descripton of each script](http://www.armory.com/~ftp/)
> -   [Steve Kinzler's Home Directory](http://www.cs.indiana.edu/hyplan/kinzler/home.html) (_Steve Kinzler_) - more than 180 scripts (shell and perl) simplifying web usage, administration, configuration
> -   [Carlos' Scripts](http://cgd.sdf-eu.org/a_scripts.html) (_Carlos J. G. Duarte_) - more than 220 useful scripts (shell, awk, perl)
>     -   [Libraries (awk, m4, perl, sh, ...)](http://cgd.sdf-eu.org/a_libs.html)
>     -   [many templates (awk, script, c, ...)](http://cgd.sdf-eu.org/a_templates.html)
> -   [GNU shtool](http://www.gnu.org/software/shtool/) (_Ralf S. Engelschall_) - a collection of useful script functionality (i.e. for software installation) in one script
>     -   [shtool download directory](ftp://ftp.gnu.org/gnu/shtool/)
> -   [Portable Shell Programming: An Extensive Collection of Bourne Shell Examples](http://www.amazon.com/exec/obidos/ASIN/0134514947/heinersshelldora) (_Bruce Blinn_)
>     -   [Examples from the book (28 KB)](ftp://ftp.prenhall.com/pub/ptr/hewlett_packard_professional_books.w-064/blinn/port.sh/shbook.tar.Z)
> -   [Unix shell programming notes](http://shell.cfajohnson.com/) (_Chris F.A. Johnson_) - Shell scripts, articles and libraries, e.g. for date manipulation or array handling
>     -   [Date functions](http://shell.cfajohnson.com/arrays/)
>     -   [Bash array functions](http://shell.cfajohnson.com/arrays/)
> -   [Linux / Unix Scripts](http://www.pixelbeat.org/scripts/) (_PÃ¡draig Brady_) - Collection of miscellaneous scripts
>     -   [pixelb / scripts github page](https://github.com/pixelb/scripts)
> -   [The tcshrc Project Page](http://sourceforge.net/projects/tcshrc/) (_Simos Xenitellis_) - a set of advanced startup scripts for the TCSH
> -   [Linux shell scripts, Bash scripting, shell programming](http://www.comp.eonworks.com/scripts/scripts.html) (_Dawid Michalczyk_) - More than 30 shell scripts for different purposes, some of them BASH specific
> 
> Sophisticated Script Examples
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [\[dilbert.sh\] CSE80 -- Lecture 4, Apr 25 -- An Example of Shell Script](http://cseweb.ucsd.edu/~bsy/cse80/lec4/script.html) (_Bennet Yee_) - Extensively explained example script getting the daily "Dilbert" comic via the Web
> -   [ccirc 2.x](http://www.cus.org.uk/~ccooke/ccirc2/) (_Charles Cooke_) - IRC client written in KSH scripts
> 
> Shell Utilities
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [The GNU Netcat -- Official homepage](http://netcat.sourceforge.net/download.php) - GNU Reimplementation of the "netcat" network utility program
> -   [GNU wget - the noninteractive download utility](http://www.gnu.org/software/wget/) (_Hrvoje Niksic_) - may be used to download files or web pages from scripts. If you are using Linux, you may already have it in /usr/bin. Solaris 9 users should search in /usr/sfw/bin
>     -   [GNU Wget Manual](http://www.gnu.org/software/wget/manual/wget.html)
>     -   [wget download directory](ftp://ftp.gnu.org/pub/gnu/wget)
> -   [ShellCheck source code, written in Haskell](https://github.com/koalaman/shellcheck) (_Vidar Holen_) - Static analysis and linting (problem checking) tool for sh / bash scripts
>     -   [ShellCheck online shell script analyzer](http://www.shellcheck.net/)
> -   [ShellCheck source code, written in Haskell](https://github.com/koalaman/shellcheck) (_Vidar Holen_) - Static analysis and linting (problem checking) tool for sh / bash scripts
>     -   [ShellCheck online shell script analyzer](http://www.shellcheck.net/)
> -   [KSH debugger](ftp://ftp.ora.com/pub/examples/nutshell/ksh/ksh.tar.Z) (_Bill Rosenblatt_) - from the book "Learning the Korn Shell" by Bill Rosenblatt. Written in KSH
>     -   [Learning the Korn Shell (Book)](http://www.amazon.com/exec/obidos/ASIN/1565920546/heinersshelldora/)
> -   [UNIX Guru Universe](http://www.ugu.com/) (_Kirk Waingrow_) - many UNIX related programs, some of them are scripts
>     -   [Shell Software - some shell utility programs written in C](http://www.ugu.com/sui/ugu/show?I=software.shell&F=1111111111&G=Y)
> -   [shc Shell Script Compiler project page](https://github.com/neurobin/shc) (_Francisco Javier Rosales Garcia_, _Jahidul Hamid_) - Converts simple shell scripts to C code, which can be compiled afterwards
>     -   [release.tar.gz (118 KB)](https://github.com/neurobin/shc/archive/release.tar.gz)
> -   [UNIX Guru Universe](http://www.ugu.com/) (_Kirk Waingrow_) - many UNIX related programs, some of them are scripts
>     -   [Shell Software - some shell utility programs written in C](http://www.ugu.com/sui/ugu/show?I=software.shell&F=1111111111&G=Y)
> -   [pipe\_scripting](http://pobox.com/~oleg/ftp/Communications.html#sh-agents) (_Oleg Kiselyov_) - A tool written in C turning "...any UNIX-interactive application into a server...". I recommend "netcat" for this purpose
> -   [Autoconf](http://www.gnu.org/software/autoconf/) - "autoconf" is the system that creates the common "configure" installation and configuration scripts based on M4 macros and shell code. The manual contains a chapter dedicated to portable shell programming, listing many lesser known quirks of different shells on different operating systems
>     -   [autoconf - Portable Shell Programming](http://www.gnu.org/software/autoconf/manual/html_node/Portable-Shell.html)
> 
> Shell Links
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [Softpanorama Virtual Library: Open Source Shells Webliography](http://www.softpanorama.org/Scripting/shells.shtml) (_Nikolai Bezroukov_) - a fairly comprehensive collection of shell scripting links. A little hard to read because of large quoted article excerpts
> -   [www.kornshell.com](http://www.kornshell.com) (_David G. Korn_) - Links to software, documentation, web-resources and books on ksh and ksh93
> -   [Korn Shell Web (kshWeb)](http://dfrench.tripod.com/kshweb.html) (_Dana French_) - KSH scripts and the "Shell Curses", a curses-like library for korn shell programmers
> 
> Tutorials
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [Advanced BASH Scripting HOWTO (HTML, current version)](http://www.tldp.org/LDP/abs/html/) (_Mendel Leo Cooper_) - Excellent, comprehensive introduction to BASH scripting. Many examples. Unfortunately BASH specific parts are not indicated explicitly
>     -   [Advanced Bash Scripting Guide (Paperback book)](http://www.amazon.com/exec/obidos/ASIN/143575218X/heinersshelldora)
>     -   [Advanced BASH Scripting HOWTO (latest version) (tar.bz2)](http://bash.webofcrafts.net/abs-guide-latest.tar.bz2)
> -   [BASH Frequently Asked Questions](http://mywiki.wooledge.org/BashFAQ) - Answers to frequently asked BASH questions, but most also apply to other Bourne-Shell compatible shells. This very helpful document is frequently updated by the users of the #BASH channel on irc.freenode.org.
> -   [An introduction to the UNIX Shell](http://rhols66.adsl.netsonic.fi/era/unix/shell.html) (_Stephen R. Bourne_) - Introduction to the Bourne shell by its inventor
>     -   [text version](http://www.softlab.ece.ntua.gr/facilities/documentation/unix/docs/sh.txt)
>     -   [PostScript (95 kb)](http://www.softlab.ece.ntua.gr/facilities/documentation/unix/docs/sh.ps)
> -   [The Grymoire - home for UNIX wizards](http://www.grymoire.com/Unix/index.html) (_Bruce Barnett_) - Excellent resource for UNIX related articles about the shell, awk, sed and more
>     -   [Sh](http://www.grymoire.com/Unix/Sh.html)
> -   [A User's Guide to the Z-Shell](http://zsh.sourceforge.net/Guide/zshguide.html) (_Peter Stephenson_) - A very extensive tutorial to the ZSH
> -   [Bash by example, Part 1](http://www.ibm.com/developerworks/linux/library/l-bash/index.html) (_Daniel Robbins_) - Good, medium-sized BASH tutorial
>     -   [Bash by example, Part 2](http://www.ibm.com/developerworks/linux/library/l-bash2/index.html)
>     -   [Bash by example, Part 3](http://www.ibm.com/developerworks/library/l-bash3/index.html)
> -   [Bourne Shell Programming](http://sayle.net/book/) (_Robert P. Sayle_) - many practical examples, not only for system administrators
> -   [Unix shell scripting with sh/ksh](http://www.dartmouth.edu/~rc/classes/ksh/) (_Richard Brittain_) - Medium sized introduction to sh/ksh scripting
> -   [Ryan's Bash Scripting Tutorial](http://ryanstutorials.net/bash-scripting-tutorial/) (_Ryan Chadwick_) - Introduction to the basic BASH scripting elements. With excercises. Describes the use of tput(1) for formatting script output.
> -   [BashGuide](http://mywiki.wooledge.org/BashGuide) (_Greg Wooledge_, _Maarten Billemont_) - BASH tutorial, provided as a Wiki
> -   [Shell Scripts and Awk on the CUED Teaching System](http://www-h.eng.cam.ac.uk/help/tpl/unix/scripts/scripts.html) (_Tim P. Love_) - Short introduction into shell programming for UNIX beginners. Note that the referenced shell is the KornShell.
> -   [Bourne Shell Programming](http://www.shellscript.sh/) - Easy Bourne shell tutorial
> -   [Book: A Scientist's and Engineer's Guide to Workstations and Supercomputers: Coping with Unix, RISC, Vectors, and Programming](http://www.amazon.com/exec/obidos/ASIN/0471532711/heinersshelldora) (_Rubin H. Landau_, _Melanie Johnson_, _Jon Maestri_) - A very gentle approach to lerning UNIX, in many small steps, starting with "Logging In". Based on a book. The "interactive" version even has a terminal window you can enter commands in (did not work for me)
> 
> References
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [Shell Command Language Index](http://pubs.opengroup.org/onlinepubs/007908799/xcu/shellix.html) (_The Open Group_) - Excellent, detailed and comprehensive reference for the Korn Shell (part of the Single UNIX(R) Specification)
> -   [Bash Reference Manual](http://tiswww.case.edu/php/chet/bash/bashref.html) (_Chet Ramey_, _Brian Fox_) - Definite reference for the "Bourne-Again SHell" (BASH)
> -   [Desktop KornShell User's Guide](http://www.oracle.com/technetwork/indexes/documentation/index.html) (_Sun Microsystems_) - Describes the dtksh (a ksh93 with Motif extension)
> -   [User Commands - ksh](http://www.oracle.com/technetwork/indexes/documentation/index.html) (_Sun Microsystems_) - ksh manual page for Solaris 9
> -   [sh manual page](http://www.neosoft.com/neosoft/man/sh.1.html) (_NeoSoft_)
>     -   [csh](http://www.neosoft.com/neosoft/man/csh.1.html)
>     -   [(pd)ksh](http://www.neosoft.com/neosoft/man/ksh.1.html)
>     -   [bash](http://www.neosoft.com/neosoft/man/bash.1.html)
>     -   [zsh](http://www.neosoft.com/neosoft/man/zsh.1.html)
>     -   [tcsh](http://www.neosoft.com/neosoft/man/tcsh.1.html)
> 
> Articles
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [Unix Shell Patterns](http://c2.com/cgi/wiki?UnixShellPatterns) (_James Coplien_, _Alan Robertson_, _Gregg Wonderly_) - A collection of "...frequent Shell programming problems that often are resolved only with expert insight"
> -   [A survey of UNIX shells](http://web.archive.org/web/20041127042140/http://www.computerbits.com/archive/1997/1100/lnx9711.html) (_Terry Griffin_) - Shortly describes the differences of the most popular shells
> -   [UNIX SHELL Quote Tutorial](http://www.grymoire.com/Unix/Quote.html) (_Bruce Barnett_) - Excellent resource for UNIX related articles about the shell, awk, sed and more
>     -   [Regular Expressions](http://www.grymoire.com/Unix/Regular.html)
>     -   [Top Ten Reasons not to use the C shell](http://www.grymoire.com/Unix/CshTop10.txt)
> -   [A Guide to Unix Shell Quoting](http://rg1-teaching.mpi-inf.mpg.de/unixffb-ss98/quoting-guide.html) (_Uwe Waldmann_) - Explanation of the different type of quoting: \\ '...',"..."
> -   [SunWorld "Unix 101" Articles (UGU Links)](http://www.ugu.com/sui/ugu/show?I=help.articles.unix101&F=1111111110&G=Y) (_Mo Budlong_) - Good shell script related articles. Take some time to browse them!
>     -   [Command line psychology 101 - How the shell program interprets commands](http://www.itworld.com/swol-0298-unix101)
>     -   [Shell Programming and simple menus (part 1)](http://www.itworld.com/swol-0797-unix101)
>     -   [Shell programming and simple menus (part 2)](http://www.itworld.com/swol-0897-unix101)
>     -   [Using history and command line editing](http://www.itworld.com/swol-0198-unix101)
> -   [Sending email with attachments on UNIX systems](http://www.panix.com/~kylet/unix-att.html) - describes how to send email from shell scripts using external programs like "metamail", "mpack", "mutt"
>     -   [Sending files as mail attachments](http://www.shelldorado.com/articles/mailattachments.html)
> -   [Bash Features](http://web.mit.edu/gnu/doc/html/features_toc.html) (_Chet Ramey_, _Brian Fox_) - Detailed description of the BASH in comparison with Bourne Shell, C-Shell and Korn Shell
> -   [autoconf - Portable Shell Programming](http://www.gnu.org/software/autoconf/manual/html_node/Portable-Shell.html) - "autoconf" is the system that creates the common "configure" installation and configuration scripts based on M4 macros and shell code. The manual contains a chapter dedicated to portable shell programming, listing many lesser known quirks of different shells on different operating systems
> -   [Shell Script Porting Guidelines](http://www.raycosoft.com/default.php) (_Raycosoft_) - highlights some aspects of portable (ksh) shell scripts
> -   [Toolman's ;login: articles](http://www.cs.duke.edu/~des/toolman/) (_Daniel E. Singer_) - Shell related articles for the ;login: magazine
> -   [Useless Use of Cat Award](http://www.iki.fi/era/unix/award.html) (_Era Eriksson_) - Description of the "award" handed out by Randal L. Schwartz in comp.unix.shell
> -   [Shell corner (unixreview.com)](http://www.unixreview.com/columns/schaefer/) (_Ed Schaefer_) - Shell scripts of different usefulness, with helpful descriptions
> -   [Consultix Shell Quoting Guidelines](http://www.consultix-inc.com/quoting1_2.txt) (_Tim Maher_) - Describes the usage of single quotes (''), quotation marks (""), and the backslash character '\\'
> -   [lintsh](http://code.dogmap.org./lintsh/) (_Paul Jarc_) - Describes unportable shell programming constructs
> -   [The Traditional Bourne Shell Family](http://www.in-ulm.de/~mascheck/bourne/) (_Sven Mascheck_) - Lists differences of Bourne Shell dialects on many UNIX platforms; helps keeping scripts portable
> -   [Tower Floor -- Shell Scripts](http://www.sct.gu.edu.au/~anthony/info/shell/) (_Anthony Thyssen_) - Some articles and tips about shell scripting, AWK, sed, ...
> -   [Answerman - Help, I've Fallen](http://www.daemonnews.org) (_Gary Kline_, _David Leonard_, _Dirk Myers_) - short, but nice article describing the very first steps to the first own shell scripts
> -   [Using Bash shell scripts for function testing](http://www.ibm.com/developerworks/linux/library/l-bashfv/index.html) (_Angel Rivers_) - Describes how to use BASH scripts for testing programs
> -   [Tip: Prompt magic](http://www.ibm.com/developerworks/linux/library/l-tip-prompt/index.html?dwzone=linux) (_Daniel Robbins_) - Short description of how to customize (e.g. colour) the BASH prompt, and set the xterm title
> 
> Downloads
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [Metalab shell binaries for Linux](http://www.ibiblio.org/pub/Linux/system/shells/!INDEX.short.html) (_Metalab_) - precompiled binaries for the most common shells, including ash, bash, csh, pdksh, rc, scsh, tcsh, zsh
> -   [Shell source codes](ftp://ftp.funet.fi/pub/unix/shells/) (_FUNET Archive_) - Source code for the following shells: ash, bash, es, esh, ksh, rc, ssh, tcsh, zsh. Some versions (i.e. pdksh) are rather old
> -   [ES - Extensible Shell](ftp://ftp.sys.utoronto.ca/pub/es/) (_Soren Dayton_, _Paul Haahr_, _Byron Rakitzis_) - A shell derived from the RC shell (the standard Plan9 shell)
> -   [RC - shell (re-implementation)](ftp://ftp.white.toronto.edu/pub/rc/) (_Byron Rakitzis_, _Tim Goodwin_) - The default shell of the Plan9 operating system
> 
> UNIX Tools
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [Awk -- A Pattern Scanning and Processing Language](http://www.softlab.ece.ntua.gr/facilities/documentation/unix/docs/awk.txt) (_Alfred V. Aho_, _Brian W. Kernighan_, _Peter J. Weinberger_) - Introduction to the language by it's authors
> -   [Make -- A Program for Maintaining Computer Programs](http://www.softlab.ece.ntua.gr/facilities/documentation/unix/docs/make.txt) (_Stuard I. Feldman_)
> -   [Sed](http://www.grymoire.com/Unix/Sed.html) (_Bruce Barnett_) - Excellent resource for UNIX related articles about the shell, awk, sed and more
>     -   [Awk](http://www.grymoire.com/Unix/Awk.html)
> 
> UNIX Tools (commercial)
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [Cactus Utilities - Shell-Lock](http://www.cactus.com/products/cactus/shell-lock.html) (_Lone Star Software Corporation_) - Commercial shell script compiler
> -   [CCsh, the Bourne Shell Compiler](http://www.comeaucomputing.com) (_Comeau Computing_)
> 
> UNIX Tools for Windows
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [U/WIN](http://www.research.att.com/software_tools) (_David G. Korn_) - UNIX environment for Windows with many tools, including an implementation of the Korn Shell
> -   [Cygwin](http://www.sourceware.org/cygwin/) (_Cygwin Solutions_) - GNU development tools for Windows, including UNIX commands and shells like BASH
> -   [djgpp](http://www.delorie.com/djgpp/) (_DJ Delorie_) - Port of the GNU C compiler to Windows
> -   [GNU utilities for Win32](http://www.wzw.tum.de/public-html/syring/win32/UnxUtils.html) (_Karl M. Syring_) - Ports of some UNIX utilities for WIndows; most notably ZSH
> 
> UNIX Tools for Windows (commercial)
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [Hamilton C shell](http://www.hamiltonlabs.com) (_Nicole Ashley Hamilton_) - An implementation of the CSH for Windows. A free demo version is available
> -   [UNIX Shell for Windows - Installer binary](http://www.janotech.com/setup.exe) (_Janotech_) - A Unix shell environment, a graphical command line shell, and a C programming library for writing shell scripts for MS Windows
> 
> UNIX and Shell Frequently Asked Questions (FAQ)
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [Csh Programming Considered Harmful](http://www.faqs.org/faqs/unix-faq/shell/csh-whynot/) (_Tom Christiansen_) - Famous article with reasons NOT to program using CSH
> -   [KSH-93 Frequently Asked Questions](http://www.kornshell.com/doc/faq.html) (_David G. Korn_) - Focuses on the newest version of the Korn Shell language
> -   [UNIX shell differences and how to change your shell](http://www.faqs.org/faqs/unix-faq/shell/shell-differences/) (_Brian Blackmore_) - A brief history of UNIX shells, shell feature comparison, and a small chapter on "how to change your shell"
> -   [comp.unix.shell FAQ (HTML version)](http://cfajohnson.com/shell/cus-faq.html) (_Joe Halpin_) - Many answers to shell script related questions. Compared to the Unix FAQ the focus is more on shell scripts than on Unix
> -   [Unix - Frequently Asked Questions (HTML version)](http://faqs.cs.uu.nl/na-bng/comp.unix.questions.html) (_Ted Timar_)
> -   [comp.lang.awk FAQ](http://www.faqs.org/faqs/computer-lang/awk/faq/) (_Russell Schulz_) - Describes how to get AWK, online-resources, and answers some actual AWK questions
> -   [comp.unix.shell](news:comp.unix.shell) - This newsgroup is a good place to pose shell questions. Almost all questions are answered
> -   [Internet FAQ Archives](http://www.faqs.org/faqs/) (_Internet FAQ Consortium_) - Official server for Frequently Asked Questions (FAQs)
> 
> Books
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [The New KornShell Command And Programming Language](http://www.amazon.com/exec/obidos/ASIN/0131827006/heinersshelldora) (_David G. Korn_, _Morris I.Bolsky_) - The definite book on ksh93. Sometimes more a reference than a tutorial
>     -   [Examples from the book](http://www.kornshell.com/examples/)
> -   [Shell Scripting Recipes](http://www.amazon.com/exec/obidos/ASIN/1590594711/heinersshelldora) (_Chris F.A. Johnson_) - A book full of interesting and ready-to-use shell scripts for learning the shell (or just using the scripts)
> -   [Wicked Cool Shell Scripts: 101 Scripts for Linux, OS X, and UNIX Systems, 2nd Edition](https://www.amazon.com/Wicked-Cool-Shell-Scripts-Systems/dp/1593276028/heinersshelldora/) (_Dave Taylor_, _Brandon Perry_)
> -   [Unix Shell Programming](http://www.amazon.com/exec/obidos/ASIN/067248448X/heinersshelldora) (_Stephen G. Kochan_, _Patrick H. Wood_)
> -   [Learning the Korn Shell](http://www.amazon.com/exec/obidos/ASIN/1565920546/heinersshelldora) (_Bill Rosenblatt_)
> -   [Learning the Bash Shell](http://www.amazon.com/exec/obidos/ASIN/1565923472/heinersshelldora) (_Bill Rosenblatt_)
> -   [Portable Shell Programming: An Extensive Collection of Bourne Shell Examples](http://www.amazon.com/exec/obidos/ASIN/0134514947/heinersshelldora) (_Bruce Blinn_)
>     -   [Examples from the book (28 KB)](ftp://ftp.prenhall.com/pub/ptr/hewlett_packard_professional_books.w-064/blinn/port.sh/shbook.tar.Z)
> -   [The Korn Shell: User and Programming Manual](http://www.amazon.com/exec/obidos/ASIN/0201176882/heinersshelldora) (_Anatole Olczak_)
> -   [Hands-On KornShell 93 Programming](http://www.amazon.com/exec/obidos/ASIN/020131018X/heinersshelldora) (_Barry Rosenberg_)
> -   [Kornshell Programming Tutorial](http://www.amazon.com/exec/obidos/ASIN/020156324X/heinersshelldora) (_Barry Rosenberg_)
> -   [Teach Yourself Shell Programming in 24 Hours](http://www.amazon.com/exec/obidos/ASIN/0672314819/heinersshelldora) (_Sriranga R. Veeraraghavan_)
> -   [The New KornShell Command And Programming Language](http://www.amazon.com/exec/obidos/ASIN/0131827006/heinersshelldora) (_David G. Korn_, _Morris I.Bolsky_) - The definite book on ksh93. Sometimes more a reference than a tutorial
>     -   [Examples from the book](http://www.kornshell.com/examples/)
> -   [An Introduction to Shell Scripting](http://www.slashetcbooks.co.uk/itss.html) (_Glen Smith_) - Teaches how to write shell scripts with many examples that are explained in much detail. Good book for beginners
>     -   [An Introduction to Shell Scripting](http://www.amazon.co.uk/exec/obidos/ASIN/095440100X)
> -   [Universal Command Guide: For Operating Systems](http://www.amazon.com/exec/obidos/ASIN/0764548336/heinersshelldora/) (_Guy Lotgering_) - A comprehensive cross-reference of UNIX commands and their options
> -   [UNIX Shells by Example (3rd edition)](http://www.amazon.com/exec/obidos/ASIN/013066538X/heinersshelldora) (_Ellie Quigley_)
> -   [From Bash to Z Shell](http://www.amazon.com/exec/obidos/ASIN/1590593766/heinersshelldora) (_Jerry D. Peek_, _Peter Stephenson_, _Oliver Kiddle_) - In addition to a basic introduction to shells, the book also covers less well documented parts of the shells, e.g customizing the prompt, binding keys, (tab-) completion (including writing them), writing editor commands, and others
> -   [Advanced Bash Scripting Guide (Paperback book)](http://www.amazon.com/exec/obidos/ASIN/143575218X/heinersshelldora) (_Mendel Leo Cooper_) - Excellent, comprehensive introduction to BASH scripting. Many examples. Unfortunately BASH specific parts are not indicated explicitly
> 
> Other Shells
> 
> [Top](http://www.shelldorado.com/links/#top)
> 
> -   [Z shell](http://dotsrc.org/) (_SunSITE Denmark_) - ZSH links, documentation, FAQs
>     -   [Z-Shell Frequently-Asked Questions](http://zsh.sourceforge.net/FAQ/)
> -   [TCSH(1) Manual Page](http://www.kitebird.com/csh-tcsh-book/tcsh.html/) (_Dave Schweisguth_)
> -   [Csh](http://www.grymoire.com/Unix/Csh.html) (_Bruce Barnett_) - Excellent resource for UNIX related articles about the shell, awk, sed and more
> -   [An Introduction to the C shell](http://www.softlab.ece.ntua.gr/facilities/documentation/unix/docs/csh.txt) (_William Joy_, _National Technical University of Athens - Software Engineering Laboratory_) - tutorial by the author of the shell

- `/etc/shells` - contains a list of available shells

```bash
        alt@andylaptop-popos:~$ cat /etc/shells
        # /etc/shells: valid login shells
        /bin/sh
        /bin/bash
        /bin/rbash
        /bin/dash
        bin/zsh
        /usr/bin/zsh
        /bin/zsh-static
        alt@andylaptop-popos:~$ which bash
        /bin/bash
```

Editors
- code .
- vim
- nano
- gedit
- atom

## Shebang or Hashbang

A script does not require `*.sh` to run, but it helps the editor know how to interpret it.

```bash
alt@andylaptop-popos:~$ which bash
/bin/bash

#<-Inside File
#! /bin/bash
<-Start File->
```

## set
`set -x`
A debugging setting:
You refer to a noisy script. You're getting verbose output from your script because of the set -x settings which are used for debugging. Once you see what is happening and have your script running the way you want it, you could comment out the set -x line by placing the # symbol in front of it.

`set -e`
This setting is telling the script to exit on a command error. For instance, if your command was to change directory to a none existing directory or to list a non-existing file, the script would terminate on the error, rather than proceeding to the next line.

## Redirection Overview

[Manual Entry](https://www.gnu.org/software/bash/manual/html_node/Redirections.html)



File	File Descriptor

- Standard Input **STDIN** `0`
- Standard Output **STDOUT** `1`
- Standard Error **STDERR** `2`

Basically you can:

- redirect stdout to a file
    - also redirect to the void
        `rm -f $(find / -name core) &> /dev/null `
    - and devices
        ` cat music.mp3 > /dev/audio`
- redirect stderr to a file
    `grep da * 2> grep-errors.txt` - std err to file
- redirect stdout to a stderr
- redirect stderr to a stdout
- redirect stderr and stdout to a file
- redirect stderr and stdout to stdout
    `grep * 2>&1`
    `ls Documents ABC> dirlist 2>&1`  STDERR redirects to the target of STDOUT (which is the file dirlist)
- redirect stderr and stdout to stderr


`&>` - all outputs
`1>&2` redirect stdout to stderr
 `grep da * 1>&2 `  - std out and err to the same file
`2>` redirect to a file
so the number- 1> says redirect to, then to reference one of the 3 use the `&`

`>` is the output redirection operator. `>>` appends output to an existing file
`<` is the input redirection operator
`>&(file)` re-directs output of one file to another. Or it redirects 1 and 2 to a file, requires a target
`>&word` is the same as above, but the former is preferred
 This is semantically equivalent to `>word 2>&1`
`&>>word` This is semantically equivalent to ,`>>word 2>&1`
input redirection

`/bin/bash < filecmds.txt`
- `COMMAND >` -  Redirect stdout to a file. Creates the file if not present, otherwise overwrites it.

- `: > filename` The > truncates file "filename" to zero length.  If file not present, creates zero-length file (same effect as 'touch').
    - the `:` serves as a dummy placeholder, producing no output.

- `> filename` - The` >` truncates file "filename" to zero length.
    -   If file not present, creates zero-length file (same effect as `touch`).  (Same result as `: >`, above, but this does not work with some shells.)

- `COMMAND >>` -  Redirect stdout to a file.  Creates the file if not present, otherwise **appends** to it.

- `1>filename` - Redirect stdout to file "filename."
- `1>>filename` -  Redirect and append stdout to file "filename."
- `2>filename` -  Redirect stderr to file "filename
- `2>>filename` -  Redirect and append stderr to file "filename."
- `&>filename`  Redirect both stdout and stderr to file "filename." This operator is now functional, as of Bash 4, final release.

-  `M>N`  "M" is a file descriptor, which defaults to 1, if not explicitly set.
     - "N" is a filename.
     - File descriptor "M" is redirect to file "N."
   M>&N
    - "M" is a file descriptor, which defaults to 1, if not set. "N" is another file descriptor

    ### Redirecting stderr, one line at a time.
      ERRORFILE=script.errors
    `  bad_command1 2>$ERRORFILE` - Error message sent to $ERRORFILE.
      `bad_command2 2>>$ERRORFILE` - Error message appended to $ERRORFILE.
      `bad_command3` - Error message echoed to stderr, + and does not appear in $ERRORFILE. These redirection commands also automatically "reset" after each line.

- `2>&1` -  Redirects stderr to stdout .  Error messages get sent to same place as standard output.
- `>>filename 2>&1`
-  `bad_command >>filename 2>&1` -  Appends both stdout and stderr to the file "filename" ...
- `2>&1 | [command(s)]` 
- `bad_command 2>&1 | awk '{print $5}` - found, Sends stderr through a pipe.
- ` |&` was added to Bash 4 as an abbreviation for `2>&1 |`.
- `i>&j` -- Redirects file descriptor i to j. All output of file pointed to by i gets sent to file pointed to by j.

`>&j`- Redirects, by default, file descriptor 1 (stdout) to j. All stdout gets sent to file pointed to by j.
`n<&-`- Close input file descriptor n.

- `0<&-`, `<&-`- Close stdin.

- `n>&-` - Close output file descriptor n.

- `- 1>&-`, `>&-`- Close stdout.
- `0< FILENAME` `< FILENAME` - Accept input from a file.
    -  Companion command to `>`, and often used in combination with it.

`grep search-word <filename`
 - `[j]<>filename` - Open file "filename" for reading and writing,+ and assign file descriptor "j" to it.
    - If "filename" does not exist, create it.
    -  If file descriptor "j" is not specified, default to fd 0, stdin.

```bash
      #  An application of this is writing at a specified place in a file. 
      echo 1234567890 > File    # Write string to "File".
      exec 3<> File             # Open "File" and assign fd 3 to it.
      read -n 4 <&3             # Read only 4 characters.
      echo -n . >&3             # Write a decimal point there.
      exec 3>&-                 # Close fd 3.
      cat File                  # ==> 1234.67890
      #  Random access, by golly.
```

- `|` Pipe.
    - General purpose process and command chaining tool.
    - Similar to ">", but more general in effect.
    - Useful for chaining commands, scripts, files, and programs together.
      cat *.txt | sort | uniq > result-file
    - Sorts the output of all the .txt files and deletes duplicate lines,
    - finally saves results to "result-file".

- `command < input-file > output-file` Or the equivalent:
`< input-file command > output-file`    Although this is non-standard.

- `command1 | command2 | command3 > output-file`
- `ls -yz >> command.log 2>&1`   Capture result of illegal options "yz" in file "command.log." 
 Because stderr is redirected to the file, + any error messages will also be there.

 Note, however, that the following does *not* give the same result.
- `ls -yz 2>&1 >> command.log`  Outputs an error message, but does not write to file.  More precisely, the command output (in this case, null) + writes to the file, but the error message goes only to stdout.

  If redirecting both stdout and stderr,

- `#+` the order of the commands makes a difference.

Closing File Descriptors

-  `exec N<>filename` Open file
- `n<&-`Close input file descriptor n.
- `0<&-`, `<&-`- Close stdin.
- `n>&-` Close output file descriptor n.
- `1>&-`, `>&-` Close stdout.
Child processes inherit open file descriptors. This is why pipes work. To prevent an fd from being inherited, close it.
 Redirecting only stderr to a pipe.

```bash
exec 3>&1                              # Save current "value" of stdout.
ls -l 2>&1 >&3 3>&- | grep bad 3>&-    # Close fd 3 for 'grep' (but not 'ls').
#              ^^^^   ^^^^
exec 3>&-                              # Now close it for the remainder of the script.
```


## Path Vars:

        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

From the above command- `${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}`

Seems to suggest that we go to ZSH_CUSTOM but if it doesnt exist, the latter.


## Permissions


Looking at Privledges

        $ touch test.sh
        $ ls -l *.sh
        >> -rw-rw-r-- 1 user user 0 Tod 00 00:00 test.sh

`touch` creates priviledges that are rw for user and group, and r for others, but not at all execute, in the case of an *.sh (shell script file)

`chmod +x test.sh`

Adds +x to all   == -rwxrwxr-x

## Comments

`#` marks a comment line

## Variables


### Special Vars (Summary of Below)

`$(uname)` returns the system script is on- works at least on Linux and MacOS

`$0` - script name

`$1`-`$99`- params

`$#` or `$@`

`$REPLY` - stores the response of the `read` command

`${#Var}` gives the length of a var



### System Environment

Generally Indicated by all caps.

Here are some common environmental variables that you will come across:

- `SHELL`: This describes the shell--in most cases, this will be **bash** but other values can be set if you prefer other options.
- `TERM`: This specifies the type of terminal to emulate when running the shell. Different hardware terminals can be emulated based on requirements.
- `USER`: The current logged in **user.**
- `PWD`: The *current working directory.*
- `OLDPWD`: The *previous working directory.* This is kept by the shell in order to switch back by running `cd -`.
- `LS_COLORS`: This defines color codes that are used to optionally add colored output to the ls command.
- `MAIL`: The path to the current user's mailbox.
- **`PATH`**: A list of directories that the system will check when looking for commands. When a user types in a command, the system will check directories in this order for the executable.
- `LANG`: The current language and localization settings, including character encoding.
- `HOME`: The current user's home directory.
`_`: The most recent previously executed command.
In addition to these environmental variables, some shell variables that you'll often see are:

-`BASHOPTS`: The list of options that were used when bash was executed. This can be useful for finding out if the shell environment will operate in the way you want it to.
-`BASH_VERSION`: The version of bash being executed, in human-readable form.
-`BASH_VERSINFO`: The version of bash, in machine-readable output.
-`COLUMNS`: The number of columns wide that are being used to draw output on the screen.
-`DIRSTACK`: The stack of directories that are available with the pushd and popd commands.
-`HISTFILESIZE`: Number of lines of command history stored to a file.
-`HISTSIZE`: Number of lines of command history allowed in memory.
-`HOSTNAME`: The hostname of the computer at this time.
-`IFS`: The internal field separator to separate input on the command line. By default, this is a space.
-`PS1`: The primary command prompt definition. This is used to define what your prompt looks like when you -start a shell session. The PS2 is used to declare secondary prompts for when a command spans multiple lines.
-`SHELLOPTS`: Shell options that can be set with the set option.
-`UID`: The UID of the current user.

Some examples:

```bash
echo Our Shell Name is $BASH
echo Our Shell Version is $BASH_VERSION
echo Our home directory is $HOME

name=Mark
10val=10
echo The name is $name
>Mark
echo value $10val
>value 0val

val=10
echo value is $val
# Variables cannot start with a number.
```

#### Preserving Whitespace (Quoted Variables)

 The quoted variable preserves whitespace. Unquoted, however, it removes tabs and newlines.

        echo $a
        echo "$a"

### Command Substitution

Two methods:

!!!note: [[`]] (Backtick)
                command_1 `command_2 −options`
        This will execute "command_2" and it's output will become the input to "command_1".

!!!note: [[$]] (Dollar Sign)
                command_1 $(command_2 -options)
        Same as above

The _pipe_ command `|`- will do the same thing:

                cat file1.txt file2.txt | less

#### Syntax

##### `{}` vs `()`

`{varname}` seems used to dereference a variable

`signal=$(nmcli device wifi | grep \* | awk '{print $6}')`

note the `$()` around the expression

There is no dollar sign required in front of ${print $6}

in this case `$6` is the variable that stores the 6th result of awk.

`echo $signal` and ``echo ${signal}` produce the same output


Is done using `$()` or ``` \`func\` ``` (back quotes)

```sh
textfile_listing=`ls *.txt`
# Variable contains names of all *.txt files in current working directory.
echo $textfile_listing

textfile_listing2=$(ls *.txt)   # The alternative form of command substitution.
echo $textfile_listing2
# Same result.
```

Command substitution may result in word splitting.

```sh
COMMAND `echo a b`     # 2 args: a and b
COMMAND "`echo a b`"   # 1 arg: "a b"
COMMAND `echo`         # no arg
COMMAND "`echo`"       # one empty arg
```

Where COMMAND is any command

An interesting example

```sh
old_tty_setting=$(stty -g)   # Save old terminal setting.
echo "Hit a key "
stty -icanon -echo           # Disable "canonical" mode for terminal.
                             # Also, disable *local* echo.
key=$(dd bs=1 count=1 2> /dev/null)   # Using 'dd' to get a keypress.
stty "$old_tty_setting"      # Restore old setting.
echo "You hit ${#key} key."  # ${#variable} = number of characters in $variable
#
# Hit any key except RETURN, and the output is "You hit 1 key."
# Hit RETURN, and it's "You hit 0 key."
```
Command substitution even permits setting a variable to the contents of a file, using either redirection or the cat command.


```sh
variable1=`<file1`      #  Set "variable1" to contents of "file1".
variable2=`cat file2`   #  Set "variable2" to contents of "file2".
                        #  This, however, forks a new process,
                        #+ so the line of code executes slower than the above version.

#  Note that the variables may contain embedded whitespace,
#+ or even (horrors), control characters.

#  It is not necessary to explicitly assign a variable.
echo "` <$0`"           # Echoes the script itself to stdout.
```

if [ -e "/proc/ide/${disk[$device]}/media" ] ; then
             hdmedia=`cat /proc/ide/${disk[$device]}/media`
...
fi

output=$(sed -n /"$1"/p $file)

Using vars within a command

```sh
#ALL THESE WAYS DONT WORK
myvar="this is a test"
echo $myvar
echo $myvar | awk {'print $3'}
var=$myvar | awk {'print $3'}
var="$myvar | awk {'print $3'}"
var='$myvar | awk {'print $3'}'
var=( $myvar | awk {'print $3'} )
var=(( $myvar | awk {'print $3'} ))
var={ $myvar | awk {'print $3'} }
var=${ $myvar | awk {'print $3'} }
var=$( $myvar | awk {'print $3'} )
var=[ $myvar | awk {'print $3'} ]
var=$( myvar | awk {'print $3'} )
var=$( $myvar | awk {'print $3'} )
var=$(( myvar | awk {'print $3'} ))
var=$(( $myvar | awk {'print $3'} ))
var=$( $myvar | awk {'print $3'} )
var=$( $myvar )
var=$myvar | awk {'print $3'}
echo $myvar | awk {'print $3'}
var=echo $myvar | awk {'print $3'}
var=`$myvar | awk {'print $3'}`
var="`$myvar | awk {'print $3'}`"
var= ${ [$myvar] | awk {'print $3'} }
var= $[[$myvar] | awk {'print $3'} ]
[$myvar] | awk {'print $3'}
[$myvar] > awk {'print $3'}
var= $("$myvar" | awk {'print $3')
var= $("echo $myvar" | awk {'print $3')
echo $myvar | awk {'print $3'}
var="echo $myvar | awk {'print $3'}"
 var=$("echo $myvar" | awk {'print $3'})


##THESE DO WORK
var=$(echo $myvar | awk {'print $3'})
var='echo $myvar | awk {'print $3'}'
var=$(echo "$myvar" | awk {'print $3'})
```

This finally worked from [here](https://unix.stackexchange.com/questions/163810/grep-on-a-variable)

using [Here Strings](http://linux.die.net/abs-guide/x15683.h)

```sh
restwo=$(grep 'Installed'<<<"$res")
```

Another example: appears inside a function but uses the hash mark to signify

We had to assign all the input values to the variable message first as `${#@}` would tell us how many command line arguments there were instead of the number of characters combined.

input_length=${#message}

```sh
message=$@
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
```


#### System variable (Environment Var)

`export ZSH="/home/alt/.oh-my-zsh"`

Reference (substitute) with `$` eg

`source $ZSH/oh-my-zsh.sh`


## Files

[Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html#sect_08_02_04)

> ### Using /dev/fd
> 
> The /dev/fd directory contains entries named 0, 1, 2, and so on. Opening the file /dev/fd/N is equivalent to duplicating file descriptor _N_. If your system provides /dev/stdin, /dev/stdout and /dev/stderr, you will see that these are equivalent to /dev/fd/0, /dev/fd/1 and /dev/fd/2, respectively.
> 
> The main use of the /dev/fd files is from the shell. This mechanism allows for programs that use pathname arguments to handle standard input and standard output in the same way as other pathnames. If /dev/fd is not available on a system, you'll have to find a way to bypass the problem. This can be done for instance using a hyphen (_\-_) to indicate that a program should read from a pipe. An example:
> 
> michel ~> **filter body.txt.gz | cat header.txt - footer.txt**
> This text is printed at the beginning of each print job and thanks the sysadmin
> for setting us up such a great printing infrastructure.
> 
> Text to be filtered.
> 
> This text is printed at the end of each print job. 
> 

### cat

 The **cat** command first reads the file header.txt, next its standard input which is the output of the **filter** command, and last the footer.txt file. The special meaning of the hyphen as a command-line argument to refer to the standard input or standard output is a misconception that has crept into many programs. There might also be problems when specifying hyphen as the first argument, since it might be interpreted as an option to the preceding command. Using /dev/fd allows for uniformity and prevents confusion:



>       michel ~> **filter body.txt | cat header.txt /dev/fd/0 footer.txt | lp** 
> 

In this clean example, all output is additionally piped through **lp** to send it to the default printer.

### Assigning file descriptors to files

Another way of looking at file descriptors is thinking of them as a way to assign a numeric value to a file. Instead of using the file name, you can use the file descriptor number. The exec built-in command can be used to replace the shell of the current process or to alter the file descriptors of the current shell. For example, it can be used to assign a file descriptor to a file. Use

`exec fdN> file`

for assigning file descriptor N to file for output, and

`exec fdN< file`

for assigning file descriptor N to file for input. After a file descriptor has been assigned to a file, it can be used with the shell redirection operators, as is demonstrated in the following example:


`michel ~> exec 4> result.txt`

`michel ~> filter body.txt | cat header.txt /dev/fd/0 footer.txt >& 4`

`michel ~> cat result.txt`

This text is printed at the beginning of each print job and thanks the sysadmin
for setting us up such a great printing infrastructure.


### Redirection of Loops

Example 20-9. Redirected for loop (both stdin and stdout redirected)



```sh

#!/bin/bash

if [ -z "$1" ]
then
  Filename=names.data          # Default, if no filename specified.
else
  Filename=$1
fi  

Savefile=$Filename.new         # Filename to save results in.
FinalName=Jonah                # Name to terminate "read" on.

line_count=`wc $Filename | awk '{ print $1 }'`  # Number of lines in target file.


for name in `seq $line_count`
do
  read name
  echo "$name"
  if [ "$name" = "$FinalName" ]
  then
    break
  fi  
done < "$Filename" > "$Savefile"     # Redirects stdin to file $Filename,
#    ^^^^^^^^^^^^^^^^^^^^^^^^^^^       and saves it to backup file.

exit 0
```

Example 20-7. Redirected until loop


```sh
#!/bin/bash
# Same as previous example, but with "until" loop.

if [ -z "$1" ]
then
  Filename=names.data         # Default, if no filename specified.
else
  Filename=$1
fi  

# while [ "$name" != Smith ]
until [ "$name" = Smith ]     # Change  !=  to =.
do
  read name                   # Reads from $Filename, rather than stdin.
  echo $name
done <"$Filename"             # Redirects stdin to file $Filename. 
#    ^^^^^^^^^^^^

# Same results as with "while" loop in previous example.

exit 0
```


[Complex Functions and Function Complexities](https://tldp.org/LDP/abs/html/complexfunct.html#REALNAME)

> There is an alternate, and perhaps less confusing method of redirecting a function's stdin. This involves redirecting the stdin to an embedded bracketed code block within the function.
> 

```sh
\# Instead of:
Function ()
{
...
} < file

# Try this:
Function ()
{
{
...
} < file
}

# Similarly,

Function ()  # This works.
{
{
echo $\*
} | tr a b
}

Function ()  # This doesn't work.
{
echo $\*
} | tr a b   # A nested code block is mandatory here.


```

## Getting User input

`read` - used to get User input

```bash
echo "Enter name : "
read name
echo "Entered name : $name"
```
        read VAR
        $VAR

        read name1 name2 name3
        echo $name1
        echo $name2
        echo $name3

### Leave the input on the same line

                read -p 'username : ' user_var
                echo "username : $user_var"

                read -sp 'password : ' pass_var
                echo "password : $pass_var"

### Read as an array

                echo "Enter names : "
                read -a names
                echo "Names : ${names[0]}, ${names[1]}

### Read without var

                read
                echo "Result $REPLY"

By default the result of `read` goes into `$REPLY`

____

## Passing arguments to a BASH script

By default- arguments are stored in `$1`, `$2`, `$3`, `$4`

`$0` stores the actual file name.

`$test.sh Mark Tom John` passing the variables from the command line.

Can also store args as an array:

                args=("$@")

This will tell bash to store the arguments as an array

                echo ${args[0]} ${args[1]} ${args[2]}

                echo $@

This prints each of the items in an array.

                echo $#

This prints the number of items in the array

`$@` - combine to array, or extract
`$#` -  count the size of an array

  Passing values to a function is the same.


Can also use Zennity

----

## Heredoc


!!!tip: Short Notes
    - [Official Doc](https://tldp.org/LDP/abs/html/here-docs.html)
    The syntax is `<destination>` `<<` `codeword`
    HERE STRING is a single line, usually string `<dest><<<("string")` There is no end
    
    Modifiers
     - `-`prefix the CODEWORD will strip whitespace at the ends.  This lets you tab over the block'' `dest<<-CODEWORD`
     - `',",\"`  Disable modifications, substitutions and dont require escaping special chars. the three are all the same.
        - if you use quotes or other modifiers, the list still ends in just CODEWORD
        - `'`CODEWORD`'` - single quotes  `'dest'<<\CODEWORD`
        - `"` double quotes  `"dest"<<\CODEWORD`
        - `\` prefix as in `dest<<\CODEWORD` 
    - `:` a null destination, basically a comment block to disable chunks of code. `:<<CODEWORD`- usually should use the above modifier to prevent `$` from being substited and running other code.
    - `\` to escape chars- such as `$` and `\` or `{},[]` etc.
    - Passing Args
        ```sh
        LoginToModule()
       {
            read -p "Username: " username
            read -p "Passphrase: " passphrase
            echo "Obtained input ${username} and ${passphrase}"
        }

        # normally the above will be interactive, but we can use:

        LoginToModule <<EOF
        adminuser
        adminpassphrase
        EOF
        ```

        to pass the values automatically.
        - To append to a dile:
            `tee <<-CODEWORD -a ./dest >/dev/null` works
            `cat <<-CODEWORD >> dest`
            - though the dash does not.
            - `cat <<CODEWORD | sed -e 's/^[ \t]*//' | tee -a ./dest ./dest2 ` this works but its very complicated.
            - I tried everything- whitespace not stripped for me for some reason.


!!!code: This complicated example implements a conditional

    ```sh
    OUTST="a
    b
    v
    d
    "
    #Or somnething similar Multiline
    if false; then
    cat << HERE
    $OUTST
    1
    2
    3
    HERE
    ; else
    cat << HERE
    $OUTST
    4 #comment
    6
    HERE
    fi

    ```


<!-- Todo look up more on this for now just an example: -->
This type of redirection instructs the shell to read input from the current source until a line containing only word (with no trailing blanks) is seen. All of the lines read up to that point are then used as the standard input (or file descriptor n if n is specified) for a command.

The format of here-documents is:

        [n]<<[-]word
                here-document
        delimiter

If the redirection operator is `<<-`, then all leading tab characters are stripped from input lines and the line containing delimiter. This allows here-documents within shell scripts to be indented in a natural fashion.


[Commands · zsh-users/antigen Wiki](https://github.com/zsh-users/antigen/wiki/Commands)

> The easiest way to do this, is using the heredoc syntax.
> 
>     antigen bundles <<EOBUNDLES
>       # Guess what to install when running an unknown command.
>       command-not-found
>     
>       # The heroku tool helper plugin.
>       heroku
>     EOBUNDLES
>     
> 
> This is equivalent to
> 
>     antigen bundle command-not-found
>     antigen bundle heroku
>     
> 
> Of course, as you can see, from the lines piped to `antigen bundles`, empty lines and those starting with a `#` are ignored. The rest are passed to `antigen bundle` without any quoting rules ~~applied.~~


Heres a quick description as my attempt to use it failed.


[Here Document And Here String | Baeldung on Linux](https://www.baeldung.com/linux/heredoc-herestring)

> In Linux, **here document (also commonly referred to as heredoc) refers to a special block of code that contains multi-line strings that will be redirected to a command**. On the other hand, **here string is a simpler version of heredoc, offering somewhat similar functionality, albeit not as powerful as the latter**.


[Bash Heredoc | Linuxize](https://linuxize.com/post/bash-heredoc/)

> When writing shell scripts you may be in a situation where you need to pass a multiline block of text or code to an interactive command, such as [`tee`](https://linuxize.com/post/linux-tee-command/) , `cat`, or [`sftp`](https://linuxize.com/post/how-to-use-linux-sftp-command-to-transfer-files/) .
> 
> In Bash and other shells like Zsh, a Here document (Heredoc) is a type of redirection that allows you to pass multiple lines of input to a command.
> 
> The syntax of writing HereDoc takes the following form:
> 
>     [COMMAND] <<[-] 'DELIMITER'
>       HERE-DOCUMENT
>     DELIMITER
>     
> 
> -   The first line starts with an optional command followed by the special redirection operator `<<` and the delimiting identifier.
>     -   You can use any string as a delimiting identifier, the most commonly used are EOF or END.
>     -   If the delimiting identifier is unquoted, the shell will substitute all variables, commands and special characters before passing the here-document lines to the command.
>     -   Appending a minus sign to the redirection operator `<<-`, will cause all leading tab characters to be ignored. This allows you to use indentation when writing here-documents in shell scripts. Leading whitespace characters are not allowed, only tab.
> -   The here-document block can contain strings, variables, commands and any other type of input.
> -   The last line ends with the delimiting identifier. White space in front of the delimiter is not allowed.

```sh

ssh -T baeldung@example.com "touch log1.txt"
ssh -T baeldung@example.com "touch log2.txt"

#becomes:

ssh -T baeldung@host.com << EOF
touch log1.txt
touch log2.txt
EOF

cat <<-EOF
    This message is indented
        This message is double indented
EOF


```

Note the last example above- the `-EOF` the `-` suppresses tabs so that we can tab things over for readability but wont pass it into output.

However, white spaces will not be suppressed even with the dash prefix.

also, `cat` works to print output of multiple lines to the stdout but `echo` does not.


The delimiter token can be any value as long as it is unique enough that it won’t appear within the content


### Disable a block of code



[Here Document And Here String | Baeldung on Linux](https://www.baeldung.com/linux/heredoc-herestring)

> 3.7. Disable Block of Code Using Here Document[](https://www.baeldung.com/linux/heredoc-herestring#7-disable-block-of-code-using-here-document)
> 
>instead of adding a prefix every line of the code with a `#` to make them into comments,  we can do it much more efficiently using **heredoc** with the dummy command ``:`.` For example, we can disable several lines of code in our shell script:
> 
>     #!/bin/bash
>     # disable-with-heredoc.sh
>     
>     : <<'DISABLED'
>     echo "This line will not show up in the console.
>     echo "Neither will this line.
>     DISABLED
>     
>     echo "This line will be printed to the console



In the case that we want to escape all the special characters, we can either quote the delimiter token or prefix the delimiter token with a backslash.

The three different ways of escaping all the special characters are:

`'EOF'` `"EOF"` `\EOF`

```sh
    cat <<'EOF'
    Some Special Characters: $ \ `
    EOF

    cat <<"EOF"
    Some Special Characters: $ \ `
    EOF

    cat <<\EOF
    Some Special Characters: $ \ `
    EOF
```

### Substitutions


[Here Document With Parameter Substitution](https://www.baeldung.com/linux/heredoc-herestring#3-here-document-with-parameter-substitution)
> 
> We can also parameterize a heredoc by using variables, thereby making it dynamic. For example, we can change the output of a heredoc based on the value of a parameter:
> 
>```sh
>   cat <<EOF
>     Hello ${USER}
>     EOF
> 
>```
> The output will then be customized based on the value of the variable _USER_.


[Here Document With Command Substitution](https://www.baeldung.com/linux/heredoc-herestring#4-here-document-with-command-substitution)

> In addition to parameters, heredoc also supports ==command substitution== in its content. For example, let’s say we want to customize the output such that it always print the current date and time:
> 
>```sh
>     cat <<EOF
>     Hello! It is currently: $(date)
>     EOF
>```
>
> Now, whenever we run the command above, the output will always have the current date and time.
> 

[Passing Arguments to Function With Here Document](https://www.baeldung.com/linux/heredoc-herestring#5-passing-arguments-to-function-with-here-document)
> 
> We can also make use of heredoc to pass arguments to a function that otherwise requires interactive user input. For example, let’s consider the following function:
> 
>```sh
>     LoginToModule()
>     {
>         read -p "Username: " username
>         read -p "Passphrase: " passphrase
>         echo "Obtained input ${username} and ${passphrase}"
>     }
>```
> 
> When invoked, the function will wait for the user’s input to capture the value for variable _username_ and _passphrase_:
> 
>```sh
>     LoginToModule
>     Username: baeldung
>     Passphrase: secret
>     Obtained input baeldung and secret
>```
> 
> Other than supplying the input interactively, we can construct a heredoc to pass the values:
> 
>```sh
>     LoginToModule <<EOF
>     adminuser
>     adminpassphrase
>     EOF
>```


Another example of the last case comes 


~~## Here Documents:~~  Here Documents are exactly the same as Here Docs...

[Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html#sect_08_02_04)


Frequently, your script might call on another program or script that requires input. The _here_ document provides a way of instructing the shell to read input from the current source until a line containing only the search string is found (no trailing blanks). All of the lines read up to that point are then used as the standard input for a command.

The result is that you don't need to call on separate files; you can use shell-special characters, and it looks nicer than a bunch of **echo**'s:

Here is _startsurf.sh_

> ```sh
> michel ~> **cat startsurf.sh**
> #!/bin/bash
> 
> # This script provides an easy way for users to choose between browsers.
> 
> echo "These are the web browsers on this system:"
>  
> # Start here document
> cat <<BROWSERS
> mozilla
> links
> lynx
> konqueror
> opera
> netscape
> BROWSERS
>
> # End here document
> 
> echo -n "Which is your favorite? "
> read browser
> 
> echo "Starting $browser, please wait..."
> $browser &>
>```


```sh
$> michel ~> startsurf.sh

These are the web browsers on this system:
mozilla
links
lynx
konqueror
opera
netscape
Which is your favorite?
$> opera

Starting opera, please wait...
```

Although we talk about a _here document_, it is supposed to be a construct within the same script. This is an example that installs a package automatically, eventhough you should normally confirm:
> 
>
>```sh
> #!/bin/bash
>  
> # This script installs packages automatically, using yum.
>  
> if \[ $# -lt 1 \]; then
>         echo "Usage: $0 package."
>         exit 1
> fi
>  
> yum install $1 << CONFIRM
> y
> CONFIRM
>```

And this is how the script runs. When prompted with the "Is this ok [y/N]" string, the script answers "y" automatically:

```sh
[...truncated example- looks like apt installer]

Resolving dependencies
Dependencies resolved
I will do the following:
[install: tuxracer 0.61-26.i386]
Is this ok [y/N]: EnterDownloading Packages
Running test transaction:
Test transaction complete, Success!
tuxracer 100 % done 1/1
Installed:  tuxracer 0.61-26.i386
Transaction(s) Complete
```

### Sending Heredoc (e.g. blocks of text) to other destinations:

[Bash Heredoc | Linuxize](https://linuxize.com/post/bash-heredoc/)

> Instead of displaying the output on the screen you can redirect it to a file using the `>`, `>>` operators.
> 
>     cat << EOF > file.txt
>     The current working directory is: $PWD
>     You are logged in as: $(whoami)
>     EOF
>     
> 
> If the file.txt doesn’t exist it will be created. When using `>` the file will be overwritten, while the `>>` will append the output to the file.
> 
>     cat << EOF >> file.txt
>     The current working directory is: $PWD
>     You are logged in as: $(whoami)
>     EOF
>     
> 
> The heredoc input can also be piped. In the following example the [`sed`](https://linuxize.com/post/how-to-use-sed-to-find-and-replace-string-in-files/) command will replace all instances of the `l` character with `e`:
> 
>     cat <<'EOF' |  sed 's/l/e/g'
>     Hello
>     World
>     EOF
>     
> 
> `Heeeo Wored`
> 
> To write the piped data to a file:
> 
>     cat <<'EOF' |  sed 's/l/e/g' > file.txt
>     Hello
>     World
>     EOF

____

## HereString  `<<<`

 much simpler version of heredoc. For that reason, here string does not need a delimiter token. It is usually preferred whenever we need a quick way to redirect some strings into a command.

[Here Document And Here String | Baeldung on Linux](https://www.baeldung.com/linux/heredoc-herestring)

> 4.1. Syntax[](https://www.baeldung.com/linux/heredoc-herestring#1-syntax-1)
> 
> To construct a here string, we use `<<<` operator to redirect a string into a command. Concretely, the syntax is:
> 
>     COMMAND <<< $VAR
> 
> What it essentially does is expanding the variable _VAR_ and redirect the output string to the _COMMAND._

[Here Document And Here String | Baeldung on Linux](https://www.baeldung.com/linux/heredoc-herestring)

> To escape special characters like $, \\, and \`, we can enclose the string with the single quote instead of the double quote:
> 
>     cat <<< 'Display special characters: $ ` \'



____


## LOGIC


### `[[` `[` `{` `(())`


**testing variables**

`if [ condition ]`
`if [[ condition ]]`

The double bracket, which is a shell **keyword,** enables additional functionality. For example, you can use `&&` and `||` instead of `-a` and `-o` and there's a regular expression matching operator `=~`.

Because `[[ ]]` is a keyword, must have spaces around it.


Also, in a simple test, double square brackets seem to evaluate quite a lot quicker than single ones. [From: ](https://stackoverflow.com/questions/2188199/how-to-use-double-or-single-brackets-parentheses-curly-braces)



        $ time for ((i=0; i<10000000; i++)); do [[ "$i" = 1000 ]]; done

        real    0m24.548s
        user    0m24.337s
        sys 0m0.036s
        $ time for ((i=0; i<10000000; i++)); do [ "$i" = 1000 ]; done

        real    0m33.478s
        user    0m33.478s
        sys 0m0.000s

_**Braces**_        

The braces, in addition to delimiting a variable name are used for parameter expansion so you can do things like:

#### Truncate the contents of a variable

        $ var="abcde"; echo ${var%d*}
        abc


Note the `%` and the wildcard `*`

#### Make substitutions similar to sed

        $ var="abcde"; echo ${var/de/12}
        abc12


#### Use a default value


        $ default="hello"; unset var; echo ${var:-$default}
        hell
        
and several more

Also, brace expansions create lists of strings which are typically iterated over in loops:

$ echo f{oo,ee,a}d
food feed fad

$ mv error.log{,.OLD}
(error.log is renamed to error.log.OLD because the brace expression
expands to "mv error.log error.log.OLD")

$ for num in {000..2}; do echo "$num"; done
000
001
002

$ echo {00..8..2}
00 02 04 06 08

$ echo {D..T..4}
D H L P T
Note that the leading zero and increment features weren't available before Bash 4.

Thanks to gboffi for reminding me about brace expansions.


`false` and `true` are built in programs in sh.

```sh
$> type false && type true
        false is a shell builtin
        true is a shell builtin
```

You can set vars to equal them though

DEBUG=false
 if $DEBUG; then echo true; else echo false; fi

have to be careful with these vars though-  a non-empty string evaluates to true

`d="false"` will evaluate to true


```sh

 $DEBUG=false 
  if $DEBUG; then echo true; else echo false; fi

  ### Bad assignment - doesnt work = 
true
 DEBUG=false   #correct way
  if $DEBUG; then echo true; else echo false; fi 
false
 DEBUG=true   
  if $DEBUG; then echo true; else echo false; fi   
true
```

### IF

```sh
if [ condition ]
then
    statement
else
    statement
elif [ condition ]
then
    statement
fi #just one fi for elif

#Note Semicolon position
if [ $val -gt 5 ] ; then echo true; else echo false ; fi
```


There should be spaces before and after the brackets

        if _[_-f $file_name_]_

#### ELSE

```bash
#! /bin/bash

word=a

if [ $word == "b" ]
then
    echo "condition is True"
else
    echo "condition is False"
fi
>>>conition is False


if [[ $word == "b" ]]
then
    echo "condition b is True"
elif
    echo "condition is False"
fi
>>>conition is False
```

!!!warning - You must have a space around the brackets- e.g.:
        if [ $word == "b" ]

    not:

        if [ $word == "b"]

    or you will get

        >>./xxx.sh: line 14: [: missing `]'


### Comparison operators

#### integer comparators

| SYM       | Meaning               | Example           |
| --------- | --------------------- | ----------------- |
| ***-eq*** | equal                 | **[**`"$a" `[[-eq]]` "$b"`**]** |
| ***-ne*** | not-equal             | **[**`"$a" `[[-ne]]` "$b"`**]** |
| ***-gt*** | greater than          | **[**`"$a" `[[-gt]]` "$b"`**]** |
| ***-ge*** | greater than or equal | **[**`"$a" `[[-ge]]` "$b"`**]** |
| ***-lt*** | less than             | **[**`"$a" `[[-lt]]` "$b"`**]** |
| ***-le*** | less than or equal    | **[**`"$a" `[[-le]]` "$b"`**]** |
| ***`<`*** | less than             | **((**`"$a" `[[<]]`"$b"`**))**  |
| ***<=***  | less than or equal to | **((**`"$a"`[[<=]]`"$b"`**))**  |
| ***>***   | greater than          | **((**`"$a"`[[>]]`"$b"`**))**   |
| ***>=***  | less than or equal to | **((**`"$a"`[[>=]]`"$b"`**))**  |




```bash
#! /bin/bash

count=10

if [ $count -eq 10]
then
    echo "condition is True"
fi
>>>conition is True
```

#### String Comparison

| SYM  | Meaning                     | Example                                  |
| ---- | --------------------------- | ---------------------------------------- |
| `=`  | is equal to                 | `if` **[**`"$a" `[[=]]`  "$b"`**]** ^*^  |
| `==` | is equal to                 | `if` **[**`"$a" `[[==]]` "$b"`**]**      |
| `!=` | is NOT equal to             | `if` **[**`"$a" `[[!=]]` "$b"`**]**      |
| `<`  | is less than^**^            | `if` **\[\[**`"$a" `[[>]]` "$b"`**\]\]** |
| `>`  | is greater than^**^         | `if` **\[\[**`"$a" `[[<]]` "$b"`**\]\]** |
| `-z` | string is null, zero length | ??? `if \[\["$a" -z]]     ?              |

note the **null** operator - `-z`

*- in the example he used '[[' not '['
** -in ASCII alphabetic order

(There don't seem to be `<=` & `>=` for STRINGS)

```bash
#! /bin/bash

word=abc

if [ $word == "abc"]
then
    echo "condition is True"
fi
>>>conition is True
```

!!!warning Warning- Using `<, >, <=, >=` with strings and integers:
    integers - use **Double Parentheses** **(( ))**

        if (("$a"<"$b"))

    Strings- still abnormal- use **Double Square Brackets** **`[[`** and   **`]]`**

        if [["$a" > "$b"]]

    ? Most other comparisons use single brackets around the conditional.

        if ["$a" = "$b"]

    Although another example used

        if ["$a" = "$b"]

The test command takes one of the following syntax forms:

!!! Note 
    test EXPRESSION
    [ EXPRESSION ]
    [[ EXPRESSION ]]
    Copy
    If you want your script to be portable, you should prefer using the old test **[ command, which is available on all POSIX shells.** The new **upgraded version of the test command [[ (double brackets)** is supported on most modern systems using Bash, Zsh, and Ksh as a default shell.


Check if File Exists

#### File Comparison

| SYM      | Meaning                          | Example                     |
| -------- | -------------------------------- | --------------------------- |
| ***-e*** | File Exists                      | `if [ `[[-e]]` $file_name]` |
| ***-f*** | Is this a regular file & exist   | `[ -f $file_name]`          |
| ***-d*** | Does the Directory exist         | `[ -d $file_name]`          |
| ***-b*** | Is it a *block*/binary file      | `[ -b $file_name]`          |
| ***-c*** | Is it a *charcter* file          | `[ -c $file_name]`          |
| ***-s*** | Is it an *empty* file            | `[ -s $file_name]`          |
| ***-r*** | Do I have *read* permission      | `[ -r $file_name]`          |
| ***-w*** | Do I have *write* permission     | `[ -w $file_name]`          |
| ***-x*** | Do I have *execution* permission | `[ -x $file_name]`          |
 
 -g set group ID flag_ is set.

 -h symbolic link

[More](https://tldp.org/LDP/abs/html/fto.html)



<!-- ^(-\p{L}) (filename|file_descriptor|string)\t((Return )*([tT]rue)( if)*)(.*?)(\2)(.*)$   - [[`$1`]] `$2` - $4 **$5** $6 $7 *$8* $9-->
[ Expression ]	Meaning
- [[`-b`]] `filename` - Return **true** if *filename* is a _block special file._

- [[`-c`]] `filename` - Return **true** if *filename* exists and is a _character special file._

- [[`-d`]] `filename` - Return **true** *filename* exists and is a _directory._

- [[`-e`]] `filename` - Return **true** *filename* exists (regardless of type).

- [[`-f`]] `filename` - Return **true** *filename* exists and is a _regular file._

- [[`-g`]] `filename` - Return **true** *filename* exists and its _set group ID flag_ is set.

- [[`-h`]] `filename` - Return **true** *filename* exists and is a _symbolic link._ 
        This operator is retained for compatibility with previous versions of this program. Do not rely on its existence; use -L instead.

- [[`-k`]] `filename` - Return **true** *filename* exists and _its sticky bit is set._

- [[`-n`]]` filename` - Return true the length of string is nonzero.

- [[`-p`]] `filename` - Return **true** *filename* is _a named pipe (FIFO)._

- [[`-r`]] `filename` - Return **true** *filename* _exists and is readable._

- [[`-s`]] `filename` - Return **true** *filename* exists and has a size greater than zero.

- [[`-t`]] `file_descriptor` - Return **true** the filename whose file descriptor number is *file_descriptor* is open and is associated with a terminal.

- [[`-u`]] `filename` - Return **true** *filename* exists and its _set user ID flag_ is set.

- [[`-w`]] `filename` - Return **true** *filename* exists _and is writable._ 

    - True indicates only that the write flag is on. The file is not writable on a read-only file system even if this test indicates true.

- [[`-x`]] `filename` - Return **true** *filename* exists and 

    -  True indicates only that the execute flag is on. If file is a directory, true indicates that file can be searched.

- [[`-z`]] `string` - Return **true** the length of *string* is zero.

- [[`-L`]] `filename` - Return **true** *filename* exists and is a symbolic link.

- [[`-O`]] `filename` - Return **true** *filename* exists and its owner matches the effective user id of this process.

- [[`-G`]] `filename` - Return **true** *filename* exists and its group matches the effective group id of this process.

- [[`-S`]] `filename` - Return **true** *filename* exists and is a socket.

`file1` [[-nt ]]`file2`	True if file1 exists and is newer than file2.
`file1` [[-ot]] `file2`	True if file1 exists and is older than file2.
`file1` [[-ef]] `file2`	True if file1 and file2 exist and refer to the same file.


!!!!!Tip Tip: Testing if it exists on path:

    I used this to test if a program existed on path:
    

    ```sh
    if [[ -x $(which cp) ]]; then
    echo "$FILE exists."
        fi
    ```


Note echo uses the `-e` flag to allow escaped characters, `\c` keeps the cursor on the same line.

As a comparator `-e` checks if the file exists

```bash
#! /bin/bash

echo -e "Enter the name of the file : \c"
read file_name

if [ -e $file_name]
then
   echo "$file_name found"
   if [ -r $file_name]
        echo "Cant Read"
   if [ -w $file_name]
        echo "Cant Write"
else
   echo "$file_name not found"
fi
```
Two types of files- a character file, or block file.

Character files are most with some text in it.  Block files are typically pictures, videos, music

```bash
#! /bin/bash
echo -e "Enter the name of the file : \c"
read file_name

if [ -f $file_name]
then
    if [ -w $file_name]
    then
        echo -e "Enter some text data.  To exit press Ctrl + d"
        cat >> $file_name #Appends to the file
    else
        echo "The file does not have write permission"
    fi # Need a fi for each if.
else
    echo "$file_name does not exist"
fi
```

#### AND, OR

`&&`, `-a` and | or `||` `-o`

!!!warning Warning - pay special attention to the subtle format differences below

```bash
if [ "$age" -gt 18 ] && [ "$age" -lt 30 ]
if [ "$age" -gt 18 -a "$age" -lt 30 ]
if [[ "$age" -gt 18 && "$age" -lt 30 ]] # note the double brackets
#the above 3 are equivalento
then
    echo "valid age"
else
    echo "age not valid"
fi


if [ "$age" -gt 18 ] || [ "$age" -lt 30 ]
if [ "$age" -gt 18 -o "$age" -lt 30 ]
if [[ [ "$age" -gt 18 || "$age" -lt 30 ]] # note the double brackets
```



### CASE

Note the odd syntax here

Importantly - CASE MATCHES PATTERNS - not necessarily explicit values- see the example below

```bash
case <variable> in #line break after in
<pattern 1>) # terminated by a close parentheses...
    <commands> #bidy
;;              # terminated by a DOUBLE Semicolon
<pattern 2>)
<other commands>
;;
esac


case expression in
    pattern1 )
        statements ;;
    pattern2 )
        statements ;;
    ...
esac #case backwards
```

Double semicolon is important because one ';' is the same as a line break as in the FOR loop.  It can be on the same line or a separate one.


```bash
vehicle=$1 #first arg

case $vehicle in
    "car" )
        echo "car is $100" ;;
    "van" )
        echo " " ;;
    "bicycle" )
        echo " " ;;
    "truck" )
        echo " " ;;
    * ) # default case
        echo "unknown vehicle" ;;
esac

#!/bin/bash
# case example
case $1 in
    start)
        echo starting
        ;;
    stop)
        echo stoping
        ;;
    restart)
        echo restarting
        ;;
    *)
        echo don\'t know
        ;;
esac

```

Note that the value is matched by patterns- [1-5]* as in 15%

```sh
#more complicated

#!/bin/bash
# Print a message about disk useage.
space_free=$( df -h | awk '{ print $5 }' | sort -n | tail -n 1 | sed 's/%//' )
case $space_free in
[1-5]*)
echo Plenty of disk space available
;;
[6-7]*)
echo There could be a problem in the near future
;;
8*)
echo Maybe we should look at clearing out old files
;;
9*)
echo We could have a serious problem on our hands soon
;;
*)
echo Something is not quite right here
;;
esac
```

From a much more elaborate script (not sure if this is standard or clever) its used for param parsing--


#### Parameter parsing

An elaborate shell parsing example

```sh
#at the top

# Default values for option variables:
quiet=false
mode="copy"
clean=false
extension="otf"
patches=("Complete")
compat=()
installpath="user"

#then usage(){ } and version(){}

# Parse options
optspec=":qvhclLCsSUwOTAM-:"
while getopts "$optspec" optchar; do
  case "${optchar}" in

    # Short options
    q) quiet=true;;
    v) version; exit 0;;
    h) usage; exit 0;;
    c) mode="copy";;
    l) mode="link";;
    L) mode="list";;
    C) clean=true;;
    s) compat=( "${compat[@]}" "Nerd Font*Mono" );;
    w) compat=( "${compat[@]}" "Windows Compatible" );;
    O) extension="otf";;
    T) extension="ttf";;
    A) patches=("Complete");;
    M) patches=();;
    S) installpath="system";;
    U) installpath="user";;

    -)
      case "${OPTARG}" in
        # Long options
        quiet) quiet=true;;
        version) version; exit 0;;
        help) usage; exit 0;;
        copy) mode="copy";;
        link) mode="link";;
        list) mode="list";;
        clean) clean=true;;
        use-single-width-glyphs) compat=( "${compat[@]}" "Nerd Font*Mono" );;
        windows) compat=( "${compat[@]}" "Windows Compatible" );;
        otf) extension="otf";;
        ttf) extension="ttf";;
        complete) patches=("Complete");;
        minimal) patches=();;
        install-to-system-path) installpath="system";;
        install-to-user-path) installpath="user";;
        *)
          case "${OPTARG}" in
            # Long options that define variations
            fontawesome | fontlinux | octicons | pomicons)
              # If the user has picked one of these options,
              # we need to unset `Complete`
              delete=("Complete")
              patches=( "${patches[@]/${delete[0]}}" )
              case "${OPTARG}" in
                fontawesome) patches=( "${patches[@]}" "Font Awesome" );;
                fontlinux) patches=( "${patches[@]}" "Font Linux" );;
                octicons) patches=( "${patches[@]}" "Octicons" );;
                pomicons) patches=( "${patches[@]}" "Pomicons" );;
              esac;;
            *)
              echo "Unknown option --${OPTARG}" >&2
              usage >&2;
              exit 1
              ;;
          esac;;
      esac;;

    *)
      echo "Unknown option -${OPTARG}" >&2
      usage >&2
      exit 1
      ;;

  esac
done
shift $((OPTIND-1))


```


### FOR LOOP

```sh
for d in ./ligature/*/
do
    echo $d
done

for n in 1 2 3 4 5 ; do echo $n ; done
```

```sh
#!/bin/bash
# Basic for loop
names='Stan Kyle Cartman'
for name in $names
do
echo $name
done
echo All done

```

```sh
# loop through a directory

for f in *; do
    if [ -d "$f" ]; then
        # $f is a directory
        echo 'something'; else
        echo "someting else";
    fi
done

for f in /usr/bin/*; do
    echo ${f};
done

#### RANGES

While there is the numerical example above, thats more an array than a range-  alternatively you can say:

```sh
#!/bin/bash
# Basic range in for loop
for value in {1..5}
do
echo $value
done
echo All done
```

!!!warning Important: It's important when specifying a range like this that there are no spaces present between the curly brackets { }. If there are then it will not be seen as a range but as a list of items.

It is also possible to specify a value to increase or decrease by each time. You do this by adding another two dots ( .. ) and the value to step by

```sh
#!/bin/bash
# Basic range with steps for loop
for value in {10..0..2}
do
echo $value
done
echo "All done"
```

One of the more useful applications of for loops is in the processing of a set of files. To do this we may use wildcards. Let's say we want to convert a series of .html files over to .php files.

```sh

# Make a php copy of any html files
for value in $1/*.html
do
cp $value $1/$( basename -s .html $value ).php
done
```

### DO WHILE LOOP

Two types, though they are essentially the same.  The example is given- it could be said

"Leave the towel on the line until it's dry."

Meanwhile, we could have said "Leave the towel on the line while it is not dry." Or: "Leave the towel on the line while it is wet."

use whichever is most clear.

#### WHILE

an example:

```sh
#!/bin/bash
# Basic while loop
counter=1
while [ $counter -le 10 ]
do
echo $counter
((counter++))
done
echo "All done"
```

#### UNTIL LOOP

```sh
#!/bin/bash
# Basic until loop
counter=1
until [ $counter -gt 10 ]
do
echo $counter
((counter++))
done
echo All done
```

### BREAK and CONTINUE

break - exiting a loop can be done with `break`.  This exits the loop and continues the code at the end of the loop

```sh
#!/bin/bash
# Make a backup set of files
for value in $1/*
    do
    used=$( df $1 | tail -1 | awk '{ print $5 }' | sed 's/%//' )
    if [ $used -gt 90 ]
        then
        echo Low disk space 1>&2
        break
    fi
    cp $value $1/backup/
done
```

The `continue` statement tells Bash to stop running through this iteration of the loop and begin the next iteration.

```sh
#!/bin/bash
# Make a backup set of files
for value in $1/*
    do
    if [ ! -r $value ]
        then
        echo $value not readable 1>&2
        continue
    fi
    cp $value $1/backup/
done
```

### SELECT

When invoked it will take all the items in list (similar to other loops this is a space separated set of items) and present them on the screen with a number before each item. A prompt will be printed after this allowing the user to select a number. When they select a number and hit enter the corresponding item will be assigned to the variable var and the commands between do and done are run. Once finished a prompt will be displayed again so the user may select another option.

select var in <list>
do
<commands>
done

- No error checking is done. If the user enters something other than a number or a number not corresponding to an item then var becomes null (empty)
- If the user hits enter without entering any data then the list of options will be displayed again.
- The loop will end when an EOF signal is entered or the break statement is issued.
- You may change the system variable PS3 to change the prompt that is displayed.

```sh
#!/bin/bash
# A simple menu system
names='Kyle Cartman Stan Quit'
PS3='Select character: '
select name in $names
do
if [ $name == 'Quit' ]
then
break
fi
echo Hello $name
done
echo Bye
```


## Math

Sym | action
-|-
[[+]] | add
[[-]] | sub
[[*]] | mult
[[/]] | div
[[%]] | mod

To cause BASH to operate- use double bracket.  Echo and values, just wont work.

```zsh
num1=20
num2=5

echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

echo $(expr num1 + num2 )
echo $(expr num1 - num2 )
echo $(expr num1 \* num2 )
echo $(expr num1 / num2 )
echo $(expr num1 % num2 )
```

!!!Note:  Note the required escapment of `*` in expr
        echo $(expr num1 \* num2 )


`expr` - does not work with float.

### bc (basic calculator)

It is a language in itself for basic cal`culations. See `man bc`

        echo "20.5+5"|bc
        echo "20.5-5"|bc
        echo "20.5*5"|bc
        echo "20.5/5"|bc ## Error returns 4.
        echo "scale=2;20.5/5"|bc ##correct
        echo "20.5%5"|bc

`scale` gives the num of decimal points.

        echo "$num1+num2"|bc

-l - calls the math library

        echo "scale=2;sqrt($num1)" | bc -l
        echo "scale=2;$num1^3
        SS" | bc -l
        echo "scale=2;sqrt($num1)" | bc -l



## if statement

                if [condition]
                then
                    statement
                fi

There should be spaces before and after the brackets

        if _[_-f $file_name_]_

## Comparison operators

### integer comparators

| SYM       | Meaning               | Example           |
| --------- | --------------------- | ----------------- |
| ***-eq*** | equal                 | **[**`"$a" `[[-eq]]` "$b"`**]** |
| ***-ne*** | not-equal             | **[**`"$a" `[[-ne]]` "$b"`**]** |
| ***-gt*** | greater than          | **[**`"$a" `[[-gt]]` "$b"`**]** |
| ***-ge*** | greater than or equal | **[**`"$a" `[[-ge]]` "$b"`**]** |
| ***-lt*** | less than             | **[**`"$a" `[[-lt]]` "$b"`**]** |
| ***-le*** | less than or equal    | **[**`"$a" `[[-le]]` "$b"`**]** |
| ***<***   | less than             | **((**`"$a" `[[<]]`"$b"`**))**   |
| ***<=***  | less than or equal to | **((**`"$a"`[[<=]]`"$b"`**))**  |
| ***>***   | greater than          | **((**`"$a"`[[>]]`"$b"`**))**   |
| ***>=***  | less than or equal to | **((**`"$a"`[[>=]]`"$b"`**))**  |




```bash
#! /bin/bash

count=10

if [ $count -eq 10]
then
    echo "condition is True"
fi
>>>conition is True
```

### String Comparison

| SYM  | Meaning                     | Example              |
| ---- | --------------------------- | -------------------- |
| `=`  | is equal to                 | `if` **[**`"$a" `[[=]]`  "$b"`**]** ^*^  |
| `==` | is equal to                 | `if` **[**`"$a" `[[==]]` "$b"`**]** |
| `!=` | is NOT equal to             | `if` **[**`"$a" `[[!=]]` "$b"`**]**  |
| `<`  | is less than^**^            | `if` **\[\[**`"$a" `[[>]]` "$b"`**\]\]** |
| `>`  | is greater than^**^         | `if` **\[\[**`"$a" `[[<]]` "$b"`**\]\]** |
| `-z` | string is null, zero length |  ??? `if \[\["$a" -z]]     ?               |
*- in the example he used '[[' not '['
** -in ASCII alphabetic order

(There don't seem to be `<=` & `>=` for STRINGS)

```bash
#! /bin/bash

word=abc

if [ $word == "abc"]
then
    echo "condition is True"
fi
>>>conition is True
```

!!!warning Warning- Using `<, >, <=, >=` with strings and integers:
    integers - use **Double Parentheses** **(( ))**

        if (("$a"<"$b"))

    Strings- still abnormal- use **Double Square Brackets** **`[[`** and   **`]]`**

        if [["$a" > "$b"]]

    ? Most other comparisons use single brackets around the conditional.

        if ["$a" = "$b"]

    Although another example used

        if ["$a" = "$b"]

### else

```bash
#! /bin/bash

word=a

if [ $word == "b"]
then
    echo "condition is True"
else
    echo "condition is False"
fi
>>>conition is False


if [[ $word == "b"]]
then
    echo "condition b is True"
elif
    echo "condition is False"
fi
>>>conition is False
```

### File Comparison

| SYM  | Meaning                     | Example              |
| ---- | --------------------------- | -------------------- |
|***-e***| File Exists| `if [ `[[-e]]` $file_name]`
|***-f***| Is this a regular file & exist | `[ -f $file_name]`|
|***-d***| Does the Directory exist | `[ -d $file_name]`|
|***-b***| Is it a *block*/binary file | `[ -b $file_name]`|
|***-c***| Is it a *charcter* file | `[ -c $file_name]`|
|***-s***| Is it an *empty* file | `[ -s $file_name]`|
|***-r***| Do I have *read* permission | `[ -r $file_name]`|
|***-w***| Do I have *write* permission | `[ -w $file_name]`|
|***-x***| Do I have *execution* permission | `[ -x $file_name]`|



As a comparator `-e` checks if the file exists
```bash
#! /bin/bash

echo -e "Enter the name of the file : \c"
read file_name

if [ -e $file_name]
then
   echo "$file_name found"
   if [ -r $file_name]
        echo "Cant Read"
   if [ -w $file_name]
        echo "Cant Write"
else
   echo "$file_name not found"
fi
```

Note:  echo uses the `-e` flag to allow escaped characters, `\c` keeps the cursor on the same line.

Two types of files- a character file, or block file.

Character files are most with some text in it.  Block files are typically pictures, videos, music

```bash
#! /bin/bash

echo -e "Enter the name of the file : \c"
read file_name

if [ -f $file_name]
then
    if [ -w $file_name]
    then
        echo -e "Enter some text data.  To exit press Ctrl + d"
        cat >> $file_name #Appends to the file
    else
        echo "The file does not have write permission"
    fi # Need a fi for each if.
else
    echo "$file_name does not exist"
fi
```

## AND, OR

`&&`, `-a`

```bash
if [ "$age" -gt 18 ] && [ "$age" -lt 30 ]
if [ "$age" -gt 18 -a "$age" -lt 30 ]
if [[ "$age" -gt 18 && "$age" -lt 30 ]] # note the double brackets
#the above 3 are equivalento
then
    echo "valid age"
else
    echo "age not valid"
fi


if [ "$age" -gt 18 ] || [ "$age" -lt 30 ]
if [ "$age" -gt 18 -o "$age" -lt 30 ]
if [[ [ "$age" -gt 18 || "$age" -lt 30 ]] # note the double brackets
```


## Math

Sym | action
-|-
[[+]] | add
[[-]] | sub
[[*]] | mult
[[/]] | div
[[%]] | mod

To cause BASH to operate- use double bracket.  Echo and values, just wont work.

```zsh
num1=20
num2=5

echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

echo $(expr num1 + num2 )
echo $(expr num1 - num2 )
echo $(expr num1 \* num2 )
echo $(expr num1 / num2 )
echo $(expr num1 % num2 )
```

!!!Note:  Note the required escapment of `*` in expr
        echo $(expr num1 \* num2 )


`expr` - does not work with float.

## bc (basic calculator)

It is a language in itself for basic cal`culations. See `man bc`

        echo "20.5+5"|bc
        echo "20.5-5"|bc
        echo "20.5*5"|bc
        echo "20.5/5"|bc ## Error returns 4.
        echo "scale=2;20.5/5"|bc ##correct
        echo "20.5%5"|bc

`scale` g;45ives the num of decimal points.

        echo "$num1+num2"|bc

-l - calls the math library

        echo "scale=2;sqrt($num1)" | bc -l
        echo "scale=2;$num1^3
        SS" | bc -l
        echo "scale=2;sqrt($num1)" | bc -l



### case

```bash

case expression in
    pattern1 )
        statements ;;
    pattern2 )
        statements ;;
    ...
esac #case backwards
```

```bash
vehicle=$1 #first arg

case $vehicle in
    "car" )
        echo "car is $100" ;;
    "van" )
        echo " " ;;
    "bicycle" )
        echo " " ;;
    "truck" )
        echo " " ;;
    * ) # default case
        echo "unknown vehicle" ;;
esac
```

## Environment Variables

`export ZSH="/home/alt/.oh-my-zsh"`


## Functions

[Source](https://linuxize.com/post/bash-functions/)

Has the general form

funcName () {

    #optional
    return [intValue]
}

Both of these ways are used as well

$name=function($param){return '';};

function name($param){return "${param}";};



You dont really pass or return values, they aren't true functions with divisions.

```sh
#!/bin/bash

var1='A'
var2='B'

my_function () {
  local var1='C'
  var2='D'
  echo "Inside function: var1: $var1, var2: $var2"
}

echo "Before executing function: var1: $var1, var2: $var2"

my_function

echo "After executing function: var1: $var1, var2: $var2"

>>Before executing function: var1: A, var2: B
>>Inside function: var1: C, var2: D
>>After executing function: var1: A, var2: D
```

!!! Note: Note - From the output above, we can conclude that:

    - If you set a local variables inside the function body with a same name as an existing global variable it will have precedence over the global variable.
    - Global variables can be changed from within the function.

Bash functions don’t allow you to return a value when called. When a bash function completes, its return value is the status of last statement executed in the function, 0 for success and non-zero decimal number in the 1 - 255 range for failure.


```sh
#!/bin/bash

my_function () {
  echo "some result"
  return 55
}

my_function
echo $?

###output
>>some result
>>55
```

The simplest option is to assign the result of the function to a global variable:

```sh
#!/bin/bash

my_function () {
  func_result="some result"
}

my_function
echo $func_result

#output
>> some result
```

Another, better option to return a value from a function is to send the value to stdout using echo or printf like shown below:

```sh
#!/bin/bash

my_function () {
  local func_result="some result"
  echo "$func_result"
}

func_result="$(my_function)"
echo $func_result

#output
>> some result
```

So basically, you set a returned valie with `func_result="$(my_function)"`

### Passing Values

Use the Parameter References `$1` `$2` etc.

longer answer:

To pass any number of arguments to the bash function simply put them right after the function’s name, separated by a space.

It is a best practice to double quote the arguments to avoid misparsing of an argument with spaces in it.

!!!Note: Parameters:

    - The passed parameters are `$1`, `$2`, `$3` … `$n`, corresponding to the position of the parameter after the function’s name.

    - The `$0` variable is reserved for the function’s name.

    - The `$#` variable holds the   number of positional parameters/arguments passed to the function.

    - The `$*` or `$@` variable holds all positional parameters/arguments passed to the function.

        #!/bin/bash

        greeting () {
        echo "Hello $1"
        }

        greeting "Joe"

        #Output
        >>Hello Joe


## Multiline Quotes

Based on this script from [Nerd-Fonts](https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh)- they do a multi line quote as follows:

 generally -

```sh
usage () {
    cat << EOF
    text
    text
    text
EOF
}
```

and explicitly

```sh
  cat << EOF
Usage: ./install.sh [-q -v -h] [[--copy | --link] --clean | --list]
                    [--use-single-width-glyphs] [--windows] [--otf | --ttf]
                    [--install-to-user-path | --install-to-system-path ]
                    [--complete | --minimal | <patches>] [FONT...]
General options:
  -q, --quiet                   Suppress output.
  -h, --help                    Display this help and exit.
[...]
EOF
}
```

```sh
version() {
  echo "Nerd Fonts installer -- Version $__ScriptVersion"
}
```

## Expansion
[Parameter-Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion)

[Parameter-Expansion-Flags](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags)
[14 Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Expansion)


[zsh: Table of Contents](http://zsh.sourceforge.net/Doc/Release/zsh_toc.html)

[14 Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Expansion)

-   [14.1 History Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#History-Expansion)
    -   [14.1.1 Overview](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Overview)
    -   [14.1.2 Event Designators](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Event-Designators)
    -   [14.1.3 Word Designators](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Word-Designators)
    -   [14.1.4 Modifiers](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Modifiers)
-   [14.2 Process Substitution](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Process-Substitution)
-   [14.3 Parameter Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion)
    -   [14.3.1 Parameter Expansion Flags](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags)
    -   [14.3.2 Rules](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Rules)
    -   [14.3.3 Examples](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Examples-1)
-   [14.4 Command Substitution](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Command-Substitution)
-   [14.5 Arithmetic Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Arithmetic-Expansion)
-   [14.6 Brace Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Brace-Expansion)
-   [14.7 Filename Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Filename-Expansion)
    -   [14.7.1 Dynamic named directories](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Dynamic-named-directories)
    -   [14.7.2 Static named directories](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Static-named-directories)
    -   [14.7.3 `=` expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#g_t_0060_003d_0027-expansion)
    -   [14.7.4 Notes](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Notes)
-   [14.8 Filename Generation](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Filename-Generation)
    -   [14.8.1 Glob Operators](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Operators)
    -   [14.8.2 ksh-like Glob Operators](http://zsh.sourceforge.net/Doc/Release/Expansion.html#ksh_002dlike-Glob-Operators)
    -   [14.8.3 Precedence](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Precedence)
    -   [14.8.4 Globbing Flags](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Globbing-Flags)
    -   [14.8.5 Approximate Matching](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Approximate-Matching)
    -   [14.8.6 Recursive Globbing](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Recursive-Globbing)
    -   [14.8.7 Glob Qualifiers](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Qualifiers)


## Process Substitution

Process substitution is supported on systems that support named pipes (FIFOs) or the /dev/fd method ofnaming open files. It takes the form of

        <(LIST)
or
        >(LIST)

The process LIST is run with its input or output connected to a FIFO or some file in `/dev/fd`. The name ofthis file is passed as an argument to the current command as the result of the expansion. If the "`>(LIST)`" formis used, writing to the file will provide input for LIST. If the "`<(LIST)`" form is used, the file passed as anargument should be read to obtain the output of LIST. Note that no space may appear between the < or >signs and the left parenthesis, otherwise the construct would be interpreted as a redirection.When available, process substitution is performed simultaneously with parameter and variable expansion,command substitution, and arithmetic expansion


## Interface

### TPUT

used for printing in specific places on the terminal window

tput cols - gives number of columns
tput lines - gives number of rows
- clear - clears the page
- cup - places the cursor at a coordinate
- bold - makes the text bold
- sgr0 - will turn bold off (and any other changes we may have made).
- `cup $( tput lines ) 0` places the cursor at the coordinate

```sh
#!/bin/bash
# Print message in center of terminal
cols=$( tput cols )
rows=$( tput lines )
message=$@
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
tput clear
tput cup $middle_row $middle_col  #tput cup places the cursor
tput bold
echo $@
tput sgr0
tput cup $( tput lines ) 0

```
