## Challenge 9.1 Release 2

**What are some of the key design philosophies of the Linux operating system?**

I found these design philosophies of Linux, but I believe they are the tip of the iceberg.

*Small is Beautiful* and *Each Program Does One Thing Well* mean that programs (or sub-components of programs) are tight, specific, and fast.

*Choose Portability Over Efficiency* and *Use Shell Scripts to Increase Leverage and Portability* go together and suggest that it is better, in the long-run (at least in some cases), to create code that not so much tailored to the specific system it is on, because the work of recreating it and running it on a new hardware system may be too costly.

*Use Software Leverage* implies that you shouldn't recreate the wheel when it comes to code functionality.  Borrow and adapt.  A phrase that stuck out to me is that "good programmers write good code and great programmers borrow good code".

*Prototype as Soon as Possible* doesn't seem unique to Linux, but means not to over-plan because code will evolve and we can't foresee everything, but we can start improving quickly and get up the power curve sooner.

*Store Data in Flat Text Files* suggests to be judicious about file size and format, for easy access and portability.

*Make Every Program a Filter* to me means that we should force user input (or process whatever is inputted by correcting errors or in some other way standardizing it) and creating a standard format of input that can be interpreted and acted upon, resulting in a standard output.  This is a form of glitch-avoidance due to unexpected input or sloppy output (as best I can surmise.)

**What is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?**

A VPS is a section of a larger hard drive accessible through the Internet, on which an operating system and application can be managed to serve the outside world. Advantages are that there is no hardware to personally buy and maintain, and that it is relatively easy to turn on/off or scale up/down.

**Why is it considered a bad idea to run programs as the root user on a Linux system?**

Root access is like super-administrator access where bugs, mistakes, viruses, or hackers could destroy the system in some way.  Blocking off root access compartmentalizes the system and makes it harder for those bad elements to do system-wide damage.

