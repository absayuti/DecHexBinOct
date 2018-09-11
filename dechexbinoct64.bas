10 rem dechexbinoct64/128 a.k.a. number systems
20 rem copyright 2013 ab sayuti hm Saman
30 rem distributed under the terms of the gnu general public license
40 rem
50 gosub 190: rem initialize
60 gosub 560: rem display main screen
70 x=1: y=24: gosub 1200: print "{light blue}enter a number (1 - 255):{yellow}";: input n
80 if n<1 then goto 170
90 gosub 560: rem re-display main screen
100 gosub 500: rem reset cell arrays
110 gosub 790: rem fill cell - decimal
120 gosub 880: rem fill cell - octal
130 gosub 1000: rem fill cell - hexa
140 gosub 1060: rem fill cell - binary
150 n=n-1: if n>0 then goto 110
160 goto 70
170 end
180 rem ----- initialisation -----------------------
190 poke 53280,0: poke 53281,0
200 xd=7: yd=14: xo=24: yo=14: xh=35: yh=20: xb=24: yb=20
210 dim dc(3): dim oct(4): dim hex(2): dim bin(8)
220 print "{clear}              {red}dec{orange}hex{green}bin{light blue}oct"
230 print "            {white}(number systems)"
240 print
250 print "a simple program that shows how a number";
260 print "is represented in decimal, octal,"
270 print "hexadecimal and binary systems."
280 print
290 print "1. user enters a number"
300 print "2. value is slotted into the four"
310 print "   number systems, one bit at a time,"
320 print "   using simple animation."
330 print
340 print
350 print
360 print
370 print
380 print
390 print
400 print
410 print "{blue}{C*39}"
420 print "version 0.3 for commodore 64 basic 2.0"
430 print "copyright 2013 ab sayuti hm saman"
440 print "may be freely distributed under the"
450 print "terms of the gnu general public license"
460 x=1: y=15: gosub 1200: print "{yellow}press <return> to continue       ";
470 input xx
480 return
490 rem ----- reset cell arrays -------------------
500 dc(0)=0: dc(1)=0: dc(2)=0
510 oct(0)=0: oct(1)=0: oct(2)=0: oct(3)=0:
520 hex(0)=0: hex(1)=0:
530 bin(0)=0: bin(1)=0: bin(2)=0: bin(3)=0: bin(4)=0:bin(5)=0:bin(6)=0:bin(7)=0
540 return
550 rem ----- display main screen -----------------
560 print"{clear}{yellow}             number systems{light blue}"
570 print
580 print "decimal                        hexa"
590 print
600 print "B  B  B  B9   octal            B  B  Bf"
610 print "B  B  B  B8                    B  B  Be"
620 print "B  B  B  B7   B  B  B  B  B7   B  B  Bd"
630 print "B  B  B  B6   B  B  B  B  B6   B  B  Bc"
640 print "B  B  B  B5   B  B  B  B  B5   B  B  Bb"
650 print "B  B  B  B4   B  B  B  B  B4   B  B  Ba"
660 print "B  B  B  B3   B  B  B  B  B3   B  B  B9"
670 print "B  B  B  B2   B  B  B  B  B2   B  B  B8"
680 print "B  B  B  B1   B  B  B  B  B1   B  B  B7"
690 print "{cm z}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm x}    {cm z}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm x}    B  B  B6"
700 print "100 10  1     512 64  8  1     B  B  B5"
710 print "                               B  B  B4"
720 print "  binary                       B  B  B3"
730 print "                               B  B  B2"
740 print "  B  B  B  B  B  B  B  B  B    B  B  B1"
750 print "  {cm z}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm e}{sh asterisk*2}{cm x}    {cm z}{sh asterisk*2}{cm e}{sh asterisk*2}{cm x}"
760 print "  128 64 32 16  8  4  2  1      16  1"
770 return
780 rem ----- fill cell - decimal -----------------
790 dc(0)=dc(0)+1
800 if dc(0)<10 then x=xd: y=yd-dc(0): gosub 1200: print "{yellow}{reverse on}{cm t}{cm t}{reverse off}": return
810 dc(0)=0: dc(1)=dc(1)+1
820 x0=xd: y0=yd: h=9: gosub 1140: rem empty slot in position 1
830 if dc(1)<10 then x=xd-3: y=yd-dc(1): gosub 1200: print "{reverse on}{cm t}{cm t}{reverse off}": return
840 dc(1)=0: dc(2)=dc(2)+1
850 x0=xd-3: y0=yd: h=9: gosub 1140: rem empty slot in position 10
860 if dc(2)<10 then x=xd-6: y=yd-dc(2): gosub 1200: print "{reverse on}{cm t}{cm t}{reverse off}": return
870 rem ----- fill cell - octal -----------------
880 oct(0)=oct(0)+1
890 if oct(0)<8 then x=xo: y=yo-oct(0): gosub 1200: print "{reverse on}{cm t}{cm t}{reverse off}": return
900 oct(0)=0: oct(1)=oct(1)+1
910 x0=xo: y0=yo: h=7: gosub 1140: rem empty slot in position 1
920 if oct(1)<8 then x=xo-3: y=yo-oct(1): gosub 1200: print "{reverse on}{cm t}{cm t}{reverse off}": return
930 oct(1)=0: oct(2)=oct(2)+1
940 x0=xo-3: y0=yo: h=7: gosub 1140: rem empty slot in position 8
950 if oct(2)<8 then x=xo-6: y=yo-oct(2): gosub 1200: print "{reverse on}{cm t}{cm t}{reverse off}": return
960 oct(2)=0: oct(3)=oct(3)+1
970 x0=xo-6: y0=yo: h=7: gosub 1140: rem empty slot in position 64
980 if oct(3)<8 then x=xo-9: y=yo-oct(3): gosub 1200: print "{reverse on}{cm t}{cm t}{reverse off}": return
990 rem ----- fill cell - hexa -------------------
1000 hex(0)=hex(0)+1
1010 if hex(0)<16 then x=xh: y=yh-hex(0): gosub 1200: print "{reverse on}{cm t}{cm t}{reverse off}": return
1020 hex(0)=0: hex(1)=hex(1)+1
1030 x0=xh: y0=yh: h=15: gosub 1140: rem empty slot in position 1
1040 if hex(1)<16 then x=xh-3: y=yh-hex(1): gosub 1200: print "{reverse on}{cm t}{cm t}{reverse off}": return
1050 rem ----- fill cell - binary -----------------
1060 i=0
1070 bin(i)=bin(i)+1
1080 if bin(i)<2 then x=xb-i*3: y=yb-bin(i): gosub 1200: print "{reverse on}{cm t}{cm t}{reverse off}": return
1090 x0=xb-i*3: y0=yb: h=1: gosub 1140: rem empty slot in position 2^i
1100 bin(i)=0: i=i+1: if i=8 then return
1110 goto 1070
1120 rem
1130 rem ----- empty slot -------------------------
1140 x = x0
1150 for y=y0-1 to y0-h step -1
1160    gosub 1200: print "  "
1170 next y
1180 return
1190 rem ------ print at ----------------------------
1200 print left$("{home}{down*25}",y);spc(x);
1210 return