###TConsoleIO by Andrey Sevast'yanov

Andrey Sevast'yanov created for Delphi 7 a very useful class: **TConsoleIO**. According to Andrey, it was originally designed to enable communication between applications written in Delphi and chess engine games, but he already stated which could have other uses.

Under **Windows** this class enables the communication of a **Delphi program** with other applications on the same computer (written in Delphi or in other languages) sending and receiving messages quickly, efficiently and securely. **_All specification and control is done by the application side in Delphi. That is, a Client/Server structure is not required._**

This class has been used in the OpenSource Tinn-R project to establish a pipe connection between Tinn-R.exe and Rterm.exe for many years, seamlessly traversing the evolution of the Windows operating system (NT, XP, Vista and 10) and the [R](https://www.r-project.org "R") environment about more than 10 years.

The Tinn-R project ([WebSite](https://nbcgib.uesc.br/tinnr/en/ "WebSite"), [SourceForge]( https://sourceforge.net/projects/tinn-r/ "SourceForge")) is migrating from Delphi 2007 to new platforms: Delphi 10.2 Tokyo, Delphi 10.3 Rio and Lazarus 2.0.2 (Free Pascal).

Recently a [update of the TConsoleIO class for Delphi XE2](https://www.developpez.net/forums/d1538860/environnements-developpement/delphi/adaptation-xe2-composant-mu-console/ "update of the TConsoleIO class for Delphi XE2") was found. The original files (from [Delphi 7](https://torry.net/authorsmore.php?id=6135 "Andrey") and [to XE2](https://www.developpez.net/forums/d1538860/environnements-developpement/delphi/adaptation-xe2-composant-mu-console/ "to XE2")) are in the **TConsoleIO folder**.

From both projects (Andrey and update to XE2) some basic adjustments have been made. This way, without the need to install the component, it is possible to compile and run the test application (test_platform) in the following versions of Delphi: **Delphi 2007**, **Delphi 10.2 Tokyo** and **10.3 Rio**.

There is also a first attempt for **FreePascal under the Lazarus IDE**. The test application is compiling but is not running well yet. Thus, I hope that more advanced users in this area of programming (IPC/pipe) can make their contribution by correcting some problems encountered. I think this will be of great use to many Delphi/FreePascal programmers.
