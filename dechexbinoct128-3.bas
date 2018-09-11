10 rem dechexbinoct128 a.k.a. number systems v0.3
20 rem Compatible with 40 or 80 Column mode
30 rem Copyright 2013 ab sayuti hm Saman
40 rem Distributed under the terms of the GNU General Public License
50 rem
60 rem print chr$(27);"x": rem for debugging 80 column mode
70 gosub 280: rem initialize:
80 if wd=40 then gosub 830: goto 100: rem display main screen 40 column
90 gosub 1060: rem main screen 80 column
100 do
110    x=0: y=24: gosub 1700: print " {light blue}Enter a number (1 to 255):{yellow}";: input n
120    if n<1 or n>255 then exit
130    if wd=40 then gosub 830: goto 150: rem re-display main screen 40 column
140    gosub 1060: rem re-display main screen 80 column
150    gosub 770: rem reset cell arrays
160    nn = n
170    do
180      x=wd-4: y=1: gosub 1700: print nn-n+1
190      gosub 1290: rem fill cell - decimal
200      gosub 1380: rem fill cell - octal
210      gosub 1500: rem fill cell - hexa
220      gosub 1560: rem fill cell - binary
230      n=n-1
240    loop while n>0
250 loop
260 end
270 rem ----- initialisation -----------------------
280 wd=40: if peek(215)=128 then wd=80
290 if wd<>40 then 400
300 rem --- 40 column -----
310 slow: poke 53280,0: poke 53281,0
320 xd=7: yd=14: xo=24: yo=14: xh=35: yh=20: xb=24: yb=20
330 x=0: sw=3 : rem sw = slot width
340 dcell$="{yellow}{reverse on}{cm t*2}{reverse off}": empty$="  "
350 hcell$="{orange}{reverse on}{cm t*2}{reverse off}"
360 bcell$="{yellow}{reverse on}{cm t*2}{reverse off}"
370 ocell$="{green}{reverse on}{cm t*2}{reverse off}"
380 goto 470
390 rem --- 80 column -----
400 fast: xd=18: yd=14: xo=49: yo=14: xh=68: yh=20: xb=50: yb=20
410 x=20: sw=6: empty$="     "
420 dcell$="{red}{reverse on}{cm t*5}{reverse off}"
430 hcell$="{orange}{reverse on}{cm t*5}{reverse off}"
440 bcell$="{yellow}{reverse on}{cm t*5}{reverse off}"
450 ocell$="{green}{reverse on}{cm t*5}{reverse off}"
460 rem -------------------
470 dim dc(3): dim oct(4): dim hex(2): dim bin(8)
480 print chr$(14);"{clear}";
490 print spc(x);"      {reverse on}{red} D E C {orange} H E X {yellow} B I N {green} O C T {reverse off}"
500 print spc(x);"            {white}(number systems)"
510 print
520 print spc(x);"A simple program that shows how a"
530 print spc(x);"number is represented in decimal,"
540 print spc(x);"octal, hexadecimal & binary systems."
550 print
560 print spc(x);"1. User enters a number"
570 print spc(x);"2. Value is slotted into the four"
580 print spc(x);"   number systems, one bit at a time,"
590 print spc(x);"   using simple animation."
600 print
610 print
620 print
630 print
640 print
650 print
660 print
670 print
680 print spc(x);"---------------------------------------"
690 print spc(x);"{cyan}Version 0.2 for Commodore 128 BASIC 7"
700 print spc(x);"Copyright 2013 AB Sayuti HM Saman"
710 print spc(x);"May be freely distributed under the"
720 print spc(x);"terms of the GNU General Public License"
730 y=15:gosub 1700: print "{yellow}Press <return> to continue       ";
740 input xx
750 return
760 rem ----- reset cell arrays -------------------
770 dc(0)=0: dc(1)=0: dc(2)=0
780 oct(0)=0: oct(1)=0: oct(2)=0: oct(3)=0
790 hex(0)=0: hex(1)=0
800 bin(0)=0: bin(1)=0: bin(2)=0: bin(3)=0: bin(4)=0:bin(5)=0:bin(6)=0:bin(7)=0
810 return
820 rem ----- display main screen 40 col ----------------
830 print"{clear}{yellow}              Number Systems{light blue}"
840 print
850 print "decimal                        hexa"
860 print
870 print "{sh -}  {sh -}  {sh -}  {sh -}9   octal            {sh -}  {sh -}  {sh -}F"
880 print "{sh -}  {sh -}  {sh -}  {sh -}8                    {sh -}  {sh -}  {sh -}E"
890 print "{sh -}  {sh -}  {sh -}  {sh -}7   {sh -}  {sh -}  {sh -}  {sh -}  {sh -}7   {sh -}  {sh -}  {sh -}D"
900 print "{sh -}  {sh -}  {sh -}  {sh -}6   {sh -}  {sh -}  {sh -}  {sh -}  {sh -}6   {sh -}  {sh -}  {sh -}C"
910 print "{sh -}  {sh -}  {sh -}  {sh -}5   {sh -}  {sh -}  {sh -}  {sh -}  {sh -}5   {sh -}  {sh -}  {sh -}B"
920 print "{sh -}  {sh -}  {sh -}  {sh -}4   {sh -}  {sh -}  {sh -}  {sh -}  {sh -}4   {sh -}  {sh -}  {sh -}A"
930 print "{sh -}  {sh -}  {sh -}  {sh -}3   {sh -}  {sh -}  {sh -}  {sh -}  {sh -}3   {sh -}  {sh -}  {sh -}9"
940 print "{sh -}  {sh -}  {sh -}  {sh -}2   {sh -}  {sh -}  {sh -}  {sh -}  {sh -}2   {sh -}  {sh -}  {sh -}8"
950 print "{sh -}  {sh -}  {sh -}  {sh -}1   {sh -}  {sh -}  {sh -}  {sh -}  {sh -}1   {sh -}  {sh -}  {sh -}7"
960 print "{cm z}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm x}    {cm z}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm x}    {sh -}  {sh -}  {sh -}6"
970 print "100 10  1     512 64  8  1     {sh -}  {sh -}  {sh -}5"
980 print "                               {sh -}  {sh -}  {sh -}4"
990 print "  binary                       {sh -}  {sh -}  {sh -}3"
1000 print "                               {sh -}  {sh -}  {sh -}2"
1010 print "  {sh -}  {sh -}  {sh -}  {sh -}  {sh -}  {sh -}  {sh -}  {sh -}  {sh -}    {sh -}  {sh -}  {sh -}1"
1020 print "  {cm z}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm x}    {cm z}{sh asterisk*2}{cm e}{sh asterisk*2}{cm x}"
1030 print "  128 64 32 16  8  4  2  1      16  1"
1040 return
1050 rem ----- display main screen 80 col ----------------
1060 print "{clear}                         {yellow}N u m b e r   S y s t e m s{cyan}"
1070 print
1080 print spc(5);"Decimal                                                 Hexadecimal"
1090 print
1100 print spc(5);"{sh -}     {sh -}     {sh -}     {sh -}9     Octal                          {sh -}     {sh -}     {sh -}F"
1110 print spc(5);"{sh -}     {sh -}     {sh -}     {sh -}8                                    {sh -}     {sh -}     {sh -}E"
1120 print spc(5);"{sh -}     {sh -}     {sh -}     {sh -}7     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}7     {sh -}     {sh -}     {sh -}D"
1130 print spc(5);"{sh -}     {sh -}     {sh -}     {sh -}6     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}6     {sh -}     {sh -}     {sh -}C"
1140 print spc(5);"{sh -}     {sh -}     {sh -}     {sh -}5     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}5     {sh -}     {sh -}     {sh -}B"
1150 print spc(5);"{sh -}     {sh -}     {sh -}     {sh -}4     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}4     {sh -}     {sh -}     {sh -}A"
1160 print spc(5);"{sh -}     {sh -}     {sh -}     {sh -}3     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}3     {sh -}     {sh -}     {sh -}9"
1170 print spc(5);"{sh -}     {sh -}     {sh -}     {sh -}2     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}2     {sh -}     {sh -}     {sh -}8"
1180 print spc(5);"{sh -}     {sh -}     {sh -}     {sh -}1     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}1     {sh -}     {sh -}     {sh -}7"
1190 print spc(5);"{cm z}{sh asterisk*5}{cm e}{sh asterisk*5}{cm e}{sh asterisk*5}{cm x}      {cm z}{sh asterisk*5}{cm e}{sh asterisk*5}{cm e}{sh asterisk*5}{cm e}{sh asterisk*5}{cm x}      {sh -}     {sh -}     {sh -}6"
1200 print spc(5);"  100    10     1          512    64     8     1        {sh -}     {sh -}     {sh -}5"
1210 print spc(5);"                                                        {sh -}     {sh -}     {sh -}4"
1220 print spc(5);"  Binary                                                {sh -}     {sh -}     {sh -}3"
1230 print spc(5);"                                                        {sh -}     {sh -}     {sh -}2"
1240 print spc(5);"  {sh -}     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}     {sh -}1"
1250 print spc(5);"  {cm z}{sh asterisk*5}{cm e}{sh asterisk*5}{cm e}{sh asterisk*5}{cm e}{sh asterisk*5}{cm e}{sh asterisk*5}{cm e}{sh asterisk*5}{cm e}{sh asterisk*5}{cm e}{sh asterisk*5}{cm x}     {cm z}{sh asterisk*5}{cm e}{sh asterisk*5}{cm x}"
1260 print spc(5);"    128    64    32    16     8     4     2     1          16     1"
1270 return
1280 rem ----- fill cell - decimal -----------------
1290 dc(0)=dc(0)+1
1300 if dc(0)<10 then x=xd: y=yd-dc(0): gosub 1700: print dcell$: return
1310 dc(0)=0: dc(1)=dc(1)+1
1320 x0=xd: y0=yd: h=9: gosub 1640: rem empty slot in position 1
1330 if dc(1)<10 then x=xd-sw: y=yd-dc(1): gosub 1700: print dcell$: return
1340 dc(1)=0: dc(2)=dc(2)+1
1350 x0=xd-sw: y0=yd: h=9: gosub 1640: rem empty slot in position 10
1360 if dc(2)<10 then x=xd-sw*2: y=yd-dc(2): gosub 1700: print dcell$: return
1370 rem ----- fill cell - octal -----------------
1380 oct(0)=oct(0)+1
1390 if oct(0)<8 then x=xo: y=yo-oct(0): gosub 1700: print ocell$: return
1400 oct(0)=0: oct(1)=oct(1)+1
1410 x0=xo: y0=yo: h=7: gosub 1640: rem empty slot in position 1
1420 if oct(1)<8 then x=xo-sw: y=yo-oct(1): gosub 1700: print ocell$: return
1430 oct(1)=0: oct(2)=oct(2)+1
1440 x0=xo-sw: y0=yo: h=7: gosub 1640: rem empty slot in position 8
1450 if oct(2)<8 then x=xo-2*sw: y=yo-oct(2): gosub 1700: print ocell$: return
1460 oct(2)=0: oct(3)=oct(3)+1
1470 x0=xo-2*sw: y0=yo: h=7: gosub 1640: rem empty slot in position 64
1480 if oct(3)<8 then x=xo-9: y=yo-oct(3): gosub 1700: print ocell$: return
1490 rem ----- fill cell - hexa -------------------
1500 hex(0)=hex(0)+1
1510 if hex(0)<16 then x=xh: y=yh-hex(0): gosub 1700: print hcell$: return
1520 hex(0)=0: hex(1)=hex(1)+1
1530 x0=xh: y0=yh: h=15: gosub 1640: rem empty slot in position 1
1540 if hex(1)<16 then x=xh-sw: y=yh-hex(1): gosub 1700: print hcell$: return
1550 rem ----- fill cell - binary -----------------
1560 i=0
1570 bin(i)=bin(i)+1
1580 if bin(i)<2 then x=xb-i*sw: y=yb-bin(i): gosub 1700: print bcell$: return
1590 x0=xb-i*sw: y0=yb: h=1: gosub 1640: rem empty slot in position 2^i
1600 bin(i)=0: i=i+1: if i=8 then return
1610 goto 1570
1620 rem
1630 rem ----- empty slot -------------------------
1640 x = x0
1650 for y=y0-1 to y0-h step -1
1660    gosub 1700: print empty$
1670 next y
1680 return
1690 rem ------ print at ----------------------------
1700 print left$("{home}{down*25}",y);spc(x);
1710 return