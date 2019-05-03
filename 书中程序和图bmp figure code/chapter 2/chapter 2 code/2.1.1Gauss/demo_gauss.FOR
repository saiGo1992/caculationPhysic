! demo_GAUSS.FOR    
! USE GAUSS.for
! A(I, J): augmented array
! N: order of the matrix! EPS: machine epsilon

	DIMENSION A(10,11)
	PRINT *
	PRINT *,' GAUSS ELIMINATION'
	DATA N/3/                          ! N is order of matrix
	DATA (A(1,J),J=1,4)/ 1,-1, 1, -4/  ! initializes matrix elements
	DATA (A(2,J),J=1,4)/ 5,-4, 3, -12/ ! initializes matrix elements
	DATA (A(3,J),J=1,4)/ 2, 1, 1, 11/  ! initializes matrix elements

	PRINT *
	PRINT * , ' AUGMENTED MATRIX '
	PRINT *
	DO I=1,N
		PRINT 61,(A(I,J),J=1,4)
61        FORMAT(1X,1P6E12.4)
	END DO
	PRINT *
	CALL GAUSS(N,A)
65    PRINT *
68    PRINT * ,' SOLUTION'
69    PRINT * , '----------------------------------------'
	PRINT * , '        I        X(I) '
70    PRINT * , '-----------------------------------------'
	DO I=1,N
72        FORMAT(5X,I5, 1PE16.6)
	    PRINT 72,I,A(I,N+1)
	END DO
75    PRINT *,'-------- -------- -------- ----------------'
80    PRINT *
	STOP
	END
