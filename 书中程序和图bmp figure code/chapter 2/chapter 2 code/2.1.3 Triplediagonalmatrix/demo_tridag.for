      program demo_tridag
	real a(5),b(5),c(5),r(5),u(5)
      data a/1,1,1,1,1/
	data b/1,2,3,4,5/
	data c/1,1,1,1,1/
	data r/3,8,15,24,29/
	n = 5
	call tridag(a,b,c,r,u,n)
      print*,(u(i),i=1,5)
	end
