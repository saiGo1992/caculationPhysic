program demo_LU
!Driver program for routine LUBKSB,LUDCMP
PARAMETER(N=3,NP=20)
DIMENSION A(NP,NP),B(NP),A1(NP,NP),X(NP),INDX(NP)
DATA (A(1,J),J=1,3)/ 2,2, 3/  
DATA (A(2,J),J=1,3)/ 4,7, 7/ 
DATA (A(3,J),J=1,3)/-2,4, 5/
DATA (B(J  ),J=1,3)/ 3,1,-7/

Call LUDCMP(A,N,NP,INDX,P)

x(:) = B(:)
CALL LUBKSB(A,N,NP,INDX,X)
WRITE(*,*)
Print*, '计算出的方程组的解'
DO I=1,N
    WRITE(*,'(1X,3F12.6)') X(I)
END DO

END