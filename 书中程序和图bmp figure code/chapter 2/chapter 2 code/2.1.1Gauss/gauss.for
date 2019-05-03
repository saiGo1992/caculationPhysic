	SUBROUTINE GAUSS(N,A)              ! Gauss elimination
	INTEGER PV                         ! Pivoting index
	DIMENSION A(10,11)
	EPS=1.0                            ! Machine epsilon is computed.
10    IF (1.0+EPS.GT.1.0) THEN
	  EPS=EPS/2.0
	  GOTO 10
	END IF
	EPS=EPS*2
	PRINT *,'                 MACHIN EPSILON= ' , EPS
	EPS2=EPS*2                         
1005  DET= 1                            ! Initialization of determinant
	DO 1010 I=1,N-1
	  PV=I
	  DO J=I+1,N
	    IF (ABS(A(PV,I))   .LT.  ABS(A(J,I))) PV=J
	  END DO
	  IF (PV.EQ.I) GOTO 1050
	  DO JC=1,N+1
	    TM=A(I,JC)
	    A(I,JC)=A(PV,JC)
	    A(PV,JC)=TM
	  END DO
1045    DET=-1*DET   ! Each time pivointing is done, sign of DET changes.
1050    IF(A(I,I).EQ.0) GOTO 1200 ! Singular matrix if A(I,I)=0.
	  DO JR=I+1, N              ! Elimination of below-diagonal.
	    IF(A(JR,I).NE.0) THEN
	      R=A(JR,I)/A(I,I)
	      DO KC=I+1,N+1
	        TEMP=A(JR,KC)
	        A(JR,KC)=A(JR,KC) -R*A(I,KC)
	        IF(ABS(A(JR,KC) ) . LT.EPS2*TEMP) A(JR,KC)=0.0
!                      If the result of subtraction is smaller than
!                      2 times machine epsilon times the original
!                      value, it is set to zero.
	      END DO
	    END IF
1060    END DO
1010  CONTINUE
	DO I=1,N
	DET=DET*A(I,I)            !  Determinant is calculated.
	END DO
	PRINT *
	PRINT * , ' DETERMINANT = ' , DET
	PRINT *
	IF(A(N,N).EQ.0) GOTO 1200
	A(N,N+1)=A(N,N+1)/A(N,N)
	DO NV=N-1,1,-1               ! Backward substitution starts.
	VA=A(NV,N+1)
	DO K=NV+1,N
	VA=VA-A(NV,K)*A(K,N+1)
	END  DO
	A(NV,N+1)=VA/A(NV, NV)
	END DO
	RETURN
1200  PRINT *, 'MATRIX IS SINGULAR'
	STOP
	END

