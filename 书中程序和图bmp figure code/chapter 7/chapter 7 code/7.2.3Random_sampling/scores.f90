! 例题7.2.5
    program scores
	parameter(nmax=10,mmax=13)
	real(8) x(nmax),y(nmax),l(0:nmax),z(mmax),ys(mmax),r
	integer i,j,k	
	data x/5.0,15.0,25.0,35.0,45.0,55.0,65.0,75.0,85.0,95.0/
	data y/0,0,0,0,0.08,0.19,0.31,0.27,0.11,0.04/
	open(2,file='scores_old.txt')
	open(5,file='scores_new.txt')  ! mmax个抽样学生成绩
	open(7,file='scores_sample.txt')
    write(2,'(2f15.5)') (x(i),y(i),i=1,nmax)
	ix=32765
    l(0)=0
	do i=1,nmax
	   l(i)=l(i-1)+y(i)
	end do
    do j=1,mmax
	   call rand(ix,r)
	   do k=1,nmax
	      if(r.le.l(k)) goto 11
	   end do
11      z(j)=x(k)
    end do
    write(5,*) (z(i),i=1,mmax)
	ys=0
	do i=1,mmax
	  k=z(i)/float(nmax) ! 确定抽样学生所在的分数段
	  ys(k)=ys(k)+1.0    ! 统计每个分数段的学生数
	end do
    do i=1,nmax
	  ys(i)=ys(i)/float(mmax)
	  write(7,*) x(i),ys(i)
	end do
	end

	subroutine rand(ix,r)
	integer i
	real(8) r
	i=ix*259
	ix=i-i/32768*32768
	r=float(ix)/32768
	return
	end



		
