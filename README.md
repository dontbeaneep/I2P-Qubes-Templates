# I2P-Qubes-Templates
All-in-one scripts for easily installing I2P with a dedicated browser for Qubes templates. Also includes the creation of 
some config files that would generate every time you build a new I2P template, hopefully avoiding having to configure 
each parameter manually with each new VM. Scripts are customizable to your needs.

## Installing
#### clone the scripts in an appvm and make them executable
* git clone https://github.com/dontbeaneep/I2P-Qubes-Templates.git
* cd I2P-Qubes-Templates
* sudo chmod +x I2P-Debian.sh
#### qvm-copy I2P-Debian.sh to your template or wherever you are running it.
#### edit the script in your preferred text editor

## Run
./I2P-Debian.sh



## Objective
My main goal is to help those who are maybe new to either Qubes or I2P. I have spent quite a few hours of my life 
answering questions and creating writeups on anonymous forums concering this work, especially for the die-hard Tor users 
seem to struggle with I2P and Qubes (linux in general, really). So I figured I would try to develop THE repository for 
all your I2P needs! 

## Approach
A popular criticism I have seen is that there is no "one-size-fits-all" solution for I2P. Tor users are used to having a
ready to go browser bundle to use for their privacy needs. They have gotten used to sticking a simple USB drive with Tails 
installed into their laptop and it work perfectly, every time. I2P requires a little bit more know-how, which can be troublesome 
if you are not Linux-saavy. That is the approach that inspired me to write these simple bash scripts. The scripts are designed 
to do every bit of the "heavy lifting" that make you nervous about installing I2P yourself.

Once Ran, these scripts will:
* Add the correct repositories needed
* Import the pgp keys needed for verificaiton
* Install I2P-Java and Librewolf (a hardened firefox)
* Configure your I2P router and Librewolf browser together so you have a dedicated browser for I2P

## Customizable
With relative ease, you'll be able to open each script in a text editor to make some necessary changes, depending on your system.
Instead of having several scripts that are almost identical except for you to choose through, I included every option you would
need inside of the script. The lines that look like code but has a "#" in the beginning of the line means that block of code is
commented out (think of it as "turned off"). You can edit the script to "turn on" or "turn off" the blocks that do or do not apply
to you. 
For example, 'I2P-Debian.sh' works on all Debian based distros (including Debian, Whonix, Ubuntu, etc). Open the script up and 
make sure the Debian block is uncommented while the Whonix block is commented out if you are trying to run this in a Debian-11 
template. Or, if you don't mind configuring the router.config and librewolf.cfg by hand, then comment out my examples and this 
script will be quite a bit faster.

## Qubes specifically, for now
These are written specifically for Qubes templates, so they will not translate perfectly to an average VM or baremetal install
of the equivalent distro. Changing the script just a tad for your specific install shouldn't be too hard, but if you are struggling,
I will be adding a variant for the Linux users who don't virtualize.
