10 rem dechexbinoct for VIC20 v0.3
20 rem copyright 2013 AB sayuti HM Saman
30 rem distributed under the terms of the GNU General Public License
40 gosub 140:gosub 360
50 gosub 900: x=0:y=22:gosub 890:print"{cyan}Number (1-255):{yellow}";:input n
60 if n<1 or n>255 then 130
70 nn=n
80 gosub 360:gosub 310
90 x=18:y=1:gosub 890:print nn-n+1
100 gosub 580:gosub 660:gosub 720:gosub 780
110 n=n-1:if n>0 then 90
120 goto 50
130 end
140 poke 36879,8: poke 36878,peek(36878)or 10
150 xd=5:yd=14:xo=13:yo=14:xh=20:yh=20:xb=15:yb=20
160 dim dec(3):dim oct(3):dim hex(2):dim bin(8)
170 cd$="{red}{reverse on}{cm t}{reverse off}":co$="{blue}{reverse on}{cm t}{reverse off}":ch$="{yellow}{reverse on}{cm t}{reverse off}":cb$="{green}{reverse on}{cm t}{reverse off}"
180 print chr$(14)
190 print"{clear} {white}*** {reverse on}{red}Dec{yellow}Hex{green}Bin{blue}Oct{reverse off}{white} ***"
200 print"      for vic 20"
210 print
220 print"A simple program that shows how a number is represented in decimal ";
230 print"octal, hexadecimal & binary systems."
240 print:print
250 print"(c)2013 absayuti saman"
260 print"GNU GPL"
270 print:print
280 print"{yellow}press <return>";
290 input xx
300 return
310 dec(0)=0:dec(1)=0:dec(2)=0
320 oct(0)=0:oct(1)=0:oct(2)=0
330 hex(0)=0:hex(1)=0
340 bin(0)=0:bin(1)=0:bin(2)=0:bin(3)=0:bin(4)=0:bin(5)=0:bin(6)=0:bin(7)=0
350 return
360 print"{clear}{cyan}  Number Systems"
370 print
380 print"{red}Decimal          {yellow}Hexa{cyan}"
390 print
400 print"{sh -} {sh -} {sh -} {sh -}9 {blue}Octal{cyan}  f{sh -} {sh -} {sh -}";
410 print"{sh -} {sh -} {sh -} {sh -}8        e{sh -} {sh -} {sh -}";
420 print"{sh -} {sh -} {sh -} {sh -}7{sh -} {sh -} {sh -} {sh -} d{sh -} {sh -} {sh -}";
430 print"{sh -} {sh -} {sh -} {sh -}6{sh -} {sh -} {sh -} {sh -} c{sh -} {sh -} {sh -}";
440 print"{sh -} {sh -} {sh -} {sh -}5{sh -} {sh -} {sh -} {sh -} b{sh -} {sh -} {sh -}";
450 print"{sh -} {sh -} {sh -} {sh -}4{sh -} {sh -} {sh -} {sh -} a{sh -} {sh -} {sh -}";
460 print"{sh -} {sh -} {sh -} {sh -}3{sh -} {sh -} {sh -} {sh -} 9{sh -} {sh -} {sh -}";
470 print"{sh -} {sh -} {sh -} {sh -}2{sh -} {sh -} {sh -} {sh -} 8{sh -} {sh -} {sh -}";
480 print"{sh -} {sh -} {sh -} {sh -}1{sh -} {sh -} {sh -} {sh -} 7{sh -} {sh -} {sh -}";
490 print"{cm z}{sh asterisk}{cm e}{sh asterisk}{cm e}{sh asterisk}{cm x} {cm z}{sh asterisk}{cm e}{sh asterisk}{cm e}{sh asterisk}{cm x} 6{sh -} {sh -} {sh -}";
500 print"                5{sh -} {sh -} {sh -}";
510 print"                4{sh -} {sh -} {sh -}";
520 print"{green}Binary{cyan}          3{sh -} {sh -} {sh -}";
530 print"                2{sh -} {sh -} {sh -}";
540 print"{sh -} {sh -} {sh -} {sh -} {sh -} {sh -} {sh -} {sh -} {sh -}{sh -} {sh -} {sh -}";
550 print"{cm z}{sh asterisk}{cm e}{sh asterisk}{cm e}{sh asterisk}{cm e}{sh asterisk}{cm e}{sh asterisk}{cm e}{sh asterisk}{cm e}{sh asterisk}{cm e}{sh asterisk}{cm x}{cm z}{sh asterisk}{cm e}{sh asterisk}{cm x}"
560 print
570 return
580 dec(0)=dec(0)+1
590 if dec(0)<10 then x=xd:y=yd-dec(0):gosub 890:print cd$:return
600 dec(0)=0:dec(1)=dec(1)+1
610 x0=xd:y0=yd:h=9:gosub 840
620 if dec(1)<10 then x=xd-2:y=yd-dec(1):gosub 890:print cd$:return
630 dec(1)=0:dec(2)=dec(2)+1
640 x0=xd-2:y0=yd:h=9:gosub 840
650 if dec(2)<10 then x=xd-4:y=yd-dec(2):gosub 890:print cd$:return
660 i=0
670 oct(i)=oct(i)+1
680 if oct(i)<8 then x=xo-2*i:y=yo-oct(i):gosub 890:print co$:return
690 x0=xo-2*i:y0=yo:h=7:gosub 840
700 oct(i)=0:i=i+1:ifi=3 then return
710 goto 670
720 i=0
730 hex(i)=hex(i)+1
740 if hex(i)<16 then x=xh-i*2:y=yh-hex(i):gosub 890:print ch$:return
750 x0=xh-i*2:y0=yh:h=15:gosub 840
760 hex(i)=0:i=i+1:ifi=2 then return
770 goto 730
780 i=0
790 bin(i)=bin(i)+1
800 if bin(i)<2 then x=xb-i*2:y=yb-bin(i):gosub 890:print cb$:return
810 x0=xb-i*2:y0=yb:h=1:gosub 840
820 bin(i)=0:i=i+1:ifi=8 then return
830 goto 790
840 x=x0
850 for y=y0-1 to y0-h step-1
860 gosub890:print" "
870 next y
880 return
890 print left$("{home}{down*25}",y);spc(x);:return
900 poke 36876,255: for xx=0 to 100: next xx: poke 36876,0: return