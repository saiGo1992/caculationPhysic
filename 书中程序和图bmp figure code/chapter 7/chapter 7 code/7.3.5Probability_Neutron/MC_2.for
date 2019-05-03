	program MC_2
	real(8) h(3)
      ix=32765; r1=15.0; r2=16.0
	ab=8.33; aniu=0.1; b=0.4
	data h/25.0,115.0,1015.0/
      do j=1,3
	   phi0 = acos(sqrt(h(j)*h(j)-r2*r2)/h(j))
	   d  = 0.0; phi = 0.0
	   do n = 1,10000
           call rand(ix,x); call rand(ix,y)
	     s=sqrt(2.0*x-x*x); c=1.0-x
	     fi=phi0*y; oa=h(j)*sin(fi)
	     ap=h(j)*cos(fi) ; ar2=sqrt(r2*r2-oa*oa)
	     if(oa.ge.r1) then 
             al=2.0*ar2/c
	     else
	       ar1=sqrt(r1*r1-oa*oa); al0=2.0*(ar2-ar1)/c
	       al1g=int(((ap+ar1)*s/c+0.5*ab)/ab)
	       al1s=int(((ap-ar1)*s/c+0.5*ab)/ab)
	       al=al0+b/s*(al1g-al1s)
           end if
           dphi=phi0/3.1416/aniu*(1.0-exp(-aniu*al))
           phi=phi+dphi
	   end do 
	   phi=phi/float(n)
	   write(*,'(2f14.7)') h(j),phi
      end do
 	end

	SUBROUTINE RAND(IX,R)
	I=IX*259
	IX=I-I/32768*32768
	R=FLOAT(IX)/32768
	RETURN
	END
