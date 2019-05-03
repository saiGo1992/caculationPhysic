PROGRAM Random_Walk
!---------------------------------------------------------
! Monte Carlo Simulation of 1D Random Walk
!
! The walker begins at the origin (x=0) and first
! step is choosen at random to be either to the
! right or left each with probability 1/2 as in Figure.
!
!
!        -a                0                 +a
! <------|-- ... --+---+---o---+---+-- ... --|------> x
!
!                       <-- -->
!
!
! The program calculates 'Average Number of Steps'
! for the walker to be outside of the region [-a,+a].
!
! Jan 2004
! Ahmet Bingul, <bingul@gantep.edu.tr>
!
!---------------------------------------------------------
IMPLICIT NONE
INTEGER :: I,J,N,X,Step,Sum,A=3
REAL    :: R,AvrS

! initiate random number generator
  CALL RANDOM_SEED

  DO I=1,6

     N    = 10**I  ! Number of Experiment
     Sum  = 0      ! Sum of steps

     DO J=1,N
        Step = 0   ! step counter
        X    = 0   ! current location of the walker

        !-- Do an experiment -----!
        DO                        !
                                  !
           CALL RANDOM_NUMBER(R)  ! Generate a random number
                                  !
           IF(R<0.5) THEN         !
               X=X-1              ! Left step
           ELSE                   !
               X=X+1              ! Right step
           END IF                 !
                                  !
           Step = Step + 1        ! Increment the step
                                  !
           IF( ABS(x) > A ) THEN  ! Is the walker outside?
              Sum = Sum + Step    ! Sum the steps
              EXIT                !
           END IF                 !
                                  !
       END DO                     !
       !--------------------------!

     END DO

     AvrS = REAL(Sum)/N           ! Average number of steps
     PRINT '(I15,F10.6)',N,AvrS   ! output N vs Avrs

  END DO

END PROGRAM Random_Walk
