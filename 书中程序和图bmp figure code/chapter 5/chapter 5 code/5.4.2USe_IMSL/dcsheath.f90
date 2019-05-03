      USE NUMERICAL_LIBRARIES
!	 USE DFIMSL
      INTEGER    MXPARM, N,IDO,  NOUT
      PARAMETER  (MXPARM=50, N=2)
      REAL       PARAM(MXPARM), T, TEND, TOL, Y(N),TSTEP,STEP,TMAX
      EXTERNAL   FCN
      CALL UMACH (2, NOUT)
	  OPEN(UNIT=3,FILE='dcsheath.DAT')
      T    = 0.0                        ! here is the initial values
      Y(1) = 0.0          
      Y(2) = 0.01
      TOL = 0.001                       ! Set error tolerance
      CALL SSET (MXPARM, 0.0, PARAM, 1) ! Set PARAM to default
      PARAM(10) = 1.0                   ! Select absolute error control
      WRITE (NOUT,99998)                ! Print header on the screen
      IDO = 1
      TSTEP = 0.0
	  TMAX=40.0                       
	  STEP=0.1                        
   10 CONTINUE
      TSTEP = TSTEP + STEP
      TEND = TSTEP
      CALL IVPRK (IDO, N, FCN, T, TEND, TOL, PARAM, Y)
      IF (TSTEP .LE. TMAX) THEN
      WRITE (NOUT,'(4F12.3)') T, Y(1),EXP(-Y(1)),1.0/SQRT(1.0+2.0*Y(1))
	 WRITE (3,'(4F12.3)') T, Y(1),EXP(-Y(1)),1.0/SQRT(1.0+2.0*Y(1))
         IF (TSTEP .EQ. TMAX) IDO = 3  ! Final call to release workspace
         GO TO 10
      END IF
      WRITE (NOUT,99999) PARAM(35)
99998 FORMAT (4X, 'ISTEP', 5X, 'Time', 9X, 'Y1', 11X, 'Y2')
99999 FORMAT (4X, 'Number of fcn calls with IVPRK =', F6.0)
      END

      SUBROUTINE FCN (N, T, Y, YPRIME)
      INTEGER    N
      REAL       T, Y(N), YPRIME(N)
      YPRIME(1) = Y(2)
      YPRIME(2) =- EXP(-Y(1))+1.0/SQRT(1.0+2.0*Y(1))
      RETURN
      END
