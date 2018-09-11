#!/usr/bin/python
"""
    Dechexbinoct for Python 3 (also run in Python 2) with colorconsole package

    The Number System Demonstration
    To show (with some animation) the number system for decimal,
       octal, hexadecimal and binary.

    (C) 2013 AB Sayuti HM Saman
    Distributed under the terms of GNU General Public License
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    ------------------------------------------------------------------------
    Algorithm:
        Display main screen (decimal, octal, binary, hex)
        Get user input for a number
        Animate distribution of number for the different system
            one by one    

    ------------------------------------------------------------------------

    Install colorconsole package
        download package from http://code.google.com/p/colorconsole/downloads/list
        sudo apt-get install python3-setuptools
        sudo easy_install3 colorconsole-0.6

    -------------------------------------------------------------------------
    Version 0.2.5 - 18 Feb 2014
            Use shorter algorithms from dechex15
            
    Version 0.2.1 - 10 Feb 2014
            Bug fixes

    Version 0.2.0 - 4 Feb 2014
            Added feature: selectable number system

    Version 0.1.3 - 30 Jan 2013
            Added intro
            
    Version 0.12 - 29 Jan 2013
            Fixed fill_container() to be similar to bleep_cell()            
            Changed animation to bit by bit
            More fancy animation when changing position

    Version 0.0.3 - 29 Jan 2013
            Completed dec, oct, hex bin
            Animation one by one

    Version 0.0.1 - 25 Jan 2013
"""
###############################################################################
#
import sys, os, time, math
from colorconsole import terminal
screen = terminal.get_terminal()
###############################################################################
#
# Titles and labels
TITLE = "NUMBER SYSTEMS"
DECIMAL = "Decimal System"
OCTAL = "Octal System"
BINARY = "Binary System"
HEXADECIMAL = "Hexadecimal System"
#
# Coordinates for the containers
DecXY = (3,14)
OctXY = (31,14)
HexXY = (64,20)
BinXY = (3,21)
#
# Colours
FG    = 7     # white
BG    = 0     # Black
BAR2  = 2     # Green
BAR8  = 3
BAR10 = 4
BAR16 = 5
BIT   = 7    # white
#
#
# Positional values
Dec = [0,0,0]
Oct = [0,0,0,0]
Hex = [0,0]
Bin = [0,0,0,0,0,0,0,0]
#
# Selection of number system to display
sel_dec = True
sel_oct = True
sel_bin = True
sel_hex = True
###############################################################################
#
def main():
    disp_intro()
    while True:
        disp_menu()
        # Display main screen 
        disp_main_screen()
        while True:
            # Get user input for a number
            number = int(get_number())
            if number==0:
                break
            n = number
            disp_main_screen()
            # Animate distribution of number for the different system
            while n > 0:
                screen.print_at(75,24," "+str(number-n+1)+" ")
                if sel_dec:
                    fill_decimal(n)
                if sel_oct:
                    fill_octal(n)
                if sel_hex:
                    fill_hexadecimal(n)
                if sel_bin:
                    fill_binary(n)
                delay()
                n = n-1
            delay()

###############################################################################
#
def disp_intro():
    screen.clear()
    screen.gotoXY(1,1)
    print("""
    The Number System Demonstration
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    This program shows how numbers are stored in various number systems:

    Decimal, Octal, Hexadecimal and Binary.

    User can enter a number between 1 to 255, and the program will show
    how each value is placed in each of the locations in the number
    systems.
    
    """)
    try:
        x = int(input("Press [Enter] to continue"))
    except:
        return

#------------------------------------------------------------------------------

def disp_menu():
    global sel_dec, sel_oct, sel_bin, sel_hex
    
    while True:
        if sel_dec:
            chk_dec = "[yes]"
        else:
            chk_dec = "[no ]"
        if sel_oct:
            chk_oct = "[yes]"
        else:
            chk_oct = "[no ]"
        if sel_bin:
            chk_bin = "[yes]"
        else:
            chk_bin = "[no ]"
        if sel_hex:
            chk_hex = "[yes]"
        else:
            chk_hex = "[no ]"
        screen.clear()
        screen.gotoXY(1,1)
        print("\n\n\tPlease select/unselect number system(s)\n")
        print("\t 1 = Decimal (base 10)     " + chk_dec)
        print("\t 2 = Octal (base 8)        " + chk_oct)
        print("\t 3 = Binary (base 2)       " + chk_bin)
        print("\t 4 = Hexadecimal (base 16) " + chk_hex)
        print("\n\t 0 = Continue...")
        ch = input("\n\t Enter a number 1,2,3,4 or 0 >> ")
        if ch=='':
            return
        x = int(ch)
        if x==0: 
            return
        elif x==1:
            sel_dec = not sel_dec
        elif x==2:
            sel_oct = not sel_oct
        elif x==3:
            sel_bin = not sel_bin
        elif x==4:
            sel_hex = not sel_hex

#------------------------------------------------------------------------------

def disp_main_screen():
    # Reset values
    global sel_dec, sel_oct, sel_bin, sel_hex 
    global Dec, Oct, Hex, Bin
    Dec = [0,0,0]
    Oct = [0,0,0,0]
    Hex = [0,0]
    Bin = [0,0,0,0,0,0,0,0]

    screen.set_color(FG,BG)
    screen.clear()
    screen.print_at(32,1,TITLE)

    if sel_dec:
        screen.print_at(DecXY[0],2,DECIMAL)
        #screen.print_at(DecXY[0],4,"  100  10   1")
        make_container(DecXY[0],DecXY[1],3,9,BAR10)
        make_bottom_label_10()
        make_right_label_10()

    if sel_oct:
        screen.print_at(OctXY[0],4,OCTAL)
        #screen.print_at(OctXY[0],5,"  512  64    8    1")
        make_container(OctXY[0],OctXY[1],4,7,BAR8)
        make_bottom_label_8()
        make_right_label_8()
    
    if sel_hex:
        screen.print_at(HexXY[0]-4,2,HEXADECIMAL)
        #screen.print_at(HexXY[0],4,"  16    1")
        make_container(HexXY[0],HexXY[1],2,15,BAR16)
        make_bottom_label_16()
        make_right_label_16()
    
    if sel_bin:
        screen.print_at(BinXY[0],17,BINARY)
        #screen.print_at(BinXY[0],19," 128   64   32   16    8    4    2    1")
        make_container(BinXY[0],BinXY[1],8,1,BAR2)
        make_bottom_label_2()

#-------------------------------------------------------------------------------

def get_number():
    screen.gotoXY(1,24)
    str = input("Enter a number between 1 to 255: ")
    if str=='':
        return 0
    number = int(str)
    if number < 0:
        print("\nThank You.\n")
        sys.exit(0)
    else:
        return number
    
#-------------------------------------------------------------------------------

def make_container(x, y, qty, height, barcolor):
    for n in range(0,qty):
        for row in range(0,height):
            screen.print_at(x+n*5, y-height+row,"     ")
            screen.set_color(FG,barcolor)
            screen.print_at(x+n*5, y-height+row," ")
            screen.print_at(x+n*5+5, y-height+row," ")
            screen.print_at(x+n*5, y,"      ")
            screen.set_color(FG,BG)
            
#------------------------------------------------------------------------------

def make_right_label_10():
    x = DecXY[0]+3*5+1
    for row in range(1,10):
        screen.print_at(x,DecXY[1]-row,row)
        
#------------------------------------------------------------------------------

def make_right_label_8():
    x = OctXY[0]+4*5+1
    for row in range(1,8):
        screen.print_at(x,OctXY[1]-row,row)
        
#------------------------------------------------------------------------------

def make_right_label_16():
    x = HexXY[0]+2*5+1
    label = ['A','B','C','D','E','F']
    for row in range(1,10):
        screen.print_at(x,HexXY[1]-row,row)
    for row in range(10,16):
        screen.print_at(x,HexXY[1]-row,label[row-10])
        
#------------------------------------------------------------------------------

def make_bottom_label_10():
    screen.set_color(FG,BAR10)
    screen.print_at(DecXY[0],DecXY[1],"  100  10   1")
    screen.set_color(FG,BG)
    
#------------------------------------------------------------------------------

def make_bottom_label_8():
    screen.set_color(FG,BAR8)
    screen.print_at(OctXY[0],OctXY[1],"  512  64    8    1")
    screen.set_color(FG,BG)
    
#------------------------------------------------------------------------------

def make_bottom_label_16():
    screen.set_color(FG,BAR16)
    screen.print_at(HexXY[0],HexXY[1],"  16    1")
    screen.set_color(FG,BG)
    
#------------------------------------------------------------------------------

def make_bottom_label_2():
    screen.set_color(FG,BAR2)
    screen.print_at(BinXY[0],BinXY[1]," 128   64   32   16    8    4    2    1")
    screen.set_color(FG,BG)
    
#------------------------------------------------------------------------------

def fill_decimal( number ):
    n = int(number)
    c = DecXY[0]
    x = [c+2*5, c+1*5, c]
    y = DecXY[1]
    i = 0
    done = False
    while not done:
        Dec[i] = Dec[i]+1
        if Dec[i]<10:
            place_cell(x[i],y,Dec[i])
            screen.print_at(x[i]+3,4,Dec[i]%10)
            done = True
        else:
            bleep_cell(x[i],y,10)
            screen.print_at(x[i]+3,4,0)
            make_container(x[i],y,1,9,BAR10)
            Dec[i] = 0
            i = i+1
            make_bottom_label_10()
        delay()
        
#------------------------------------------------------------------------------

def fill_octal( number ):
    n = int(number)
    c = OctXY[0]
    x = [c+3*5, c+2*5, c+1*5, c]
    y = OctXY[1]
    i = 0
    done = False
    while not done:
        Oct[i] = Oct[i]+1
        if Oct[i]<8:
            place_cell(x[i],y,Oct[i])
            screen.print_at(x[i]+3,6,Oct[i]%8)
            done = True
        else:
            bleep_cell(x[i],y,8)
            screen.print_at(x[i]+3,6,0)
            make_container(x[i],y,1,7,BAR8)
            Oct[i] = 0
            i = i+1
            make_bottom_label_8()
        delay()
        
#------------------------------------------------------------------------------

def fill_hexadecimal( number ):
    ch = ['A', 'B', 'C', 'D', 'E', 'F']
    n = int(number)
    c = HexXY[0]
    x = [c+1*5, c]
    y = HexXY[1]
    i = 0
    done = False
    while not done:
        Hex[i] = Hex[i]+1
        if Hex[i]<16:
            place_cell(x[i],y,Hex[i])
            val = Hex[i]%16
            if val<10:
                screen.print_at(x[i]+3,4,val)
            else:
                screen.print_at(x[i]+3,4,ch[val-10])
            done = True
        else:
            bleep_cell(x[i],y,16)
            screen.print_at(x[i]+3,4,0)
            make_container(x[i],y,1,15,BAR16)
            Hex[i] = 0
            i = i+1
            make_bottom_label_16()
        delay()
        
#------------------------------------------------------------------------------

def fill_binary( number ):
    n = int(number)
    c = BinXY[0]
    x = [c+7*5, c+6*5, c+5*5, c+4*5, c+3*5, c+2*5, c+1*5, c]
    y = BinXY[1]
    i = 0
    done = False
    while not done:
        Bin[i] = Bin[i]+1
        if Bin[i]==1:
            fill_container(x[i],y,0)
            screen.print_at(x[i]+3,19,Bin[i]%2)
            done = True
        else:
            bleep_cell(x[i],y,2)
            screen.print_at(x[i]+3,19,0)
            make_container(x[i],y,1,1,BAR2)
            Bin[i] = 0
            i = i+1
            make_bottom_label_2()
        delay()
#------------------------------------------------------------------------------
#
def fill_container(x, y, height):
    screen.set_color(BG,BIT)
    screen.print_at(x+1, y-1-height,"____")
    screen.set_color(FG,BG)
#------------------------------------------------------------------------------
#
def place_cell(x, y, n):
    screen.set_color(BG,BIT)
    screen.print_at(x+1, y-n,"____")
    screen.set_color(FG,BG)
    
#------------------------------------------------------------------------------
#
def bleep_cell(x, y, n):
    for i in range(1,3):
        screen.set_color(BG,BIT)
        screen.print_at(x+1, y-n,"____")
        delay()
        screen.set_color(FG,BG)
        screen.print_at(x+1, y-n,"    ")
        delay()
        
#------------------------------------------------------------------------------
#
def delay():
    for anumber in range(1,555):
        screen.print_at(1,1," ")
        
#------------------------------------------------------------------------------
#      
# End of function definitions
#
# Call main()
#
if __name__ == "__main__":
   main()
#
# End of program
#
