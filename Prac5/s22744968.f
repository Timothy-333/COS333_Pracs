      PROGRAM STATISTICS_PROGRAM
      INTEGER ARR(5), MODE_VALUE , SMALLEST, LARGEST, I
C     Call subroutine to read data
      CALL READDATA(ARR)
C     Find smallest value
      SMALLEST = ifindSmallest(ARR)
C     Find largest value
      LARGEST = ifindLargest(ARR)
C     Find mode value
      MODE_VALUE = MODE(ARR)
C     Print results
      PRINT *, 'Smallest value: ', SMALLEST
      PRINT *, 'Largest value: ', LARGEST
      PRINT *, 'Mode value: ', MODE_VALUE
      END PROGRAM STATISTICS_PROGRAM

      SUBROUTINE READDATA(ARR)
      INTEGER ARR(5), I
      PRINT *, 'Enter five integer values: '
      DO I = 1, 5
          READ(*, *) ARR(I)
      END DO
      END SUBROUTINE READDATA

      INTEGER FUNCTION ifindSmallest(ARR)
      INTEGER ARR(5), I
      ifindSmallest = ARR(1)
      DO I = 2, 5
          IF (ARR(I) .LT. ifindSmallest) THEN
            ifindSmallest = ARR(I)
          END IF
      END DO
      END FUNCTION ifindSmallest

      INTEGER FUNCTION ifindLargest(ARR)
      INTEGER ARR(5), I
      ifindLargest = ARR(1)
      DO I = 2, 5
          IF (ARR(I) .GT. ifindLargest) THEN
              ifindLargest = ARR(I)
          END IF
      END DO
      END FUNCTION ifindLargest

      INTEGER FUNCTION MODE(ARR)
      IMPLICIT NONE
      INTEGER, DIMENSION(5) :: ARR
      INTEGER :: I, J, CURRENT_COUNT, MAX_COUNT, MODE_VALUE
      LOGICAL, DIMENSION(5) :: COUNTED  
      COUNTED = .FALSE.
      MAX_COUNT = 0
      MODE_VALUE = ARR(1)  
      DO I = 1, SIZE(ARR)
          IF (.NOT. COUNTED(I)) THEN
              CURRENT_COUNT = 1
              DO J = I + 1, SIZE(ARR)
                  IF (ARR(J) == ARR(I)) THEN
                      CURRENT_COUNT = CURRENT_COUNT + 1
                      COUNTED(J) = .TRUE.
                  END IF
              END DO
              IF (CURRENT_COUNT > MAX_COUNT) THEN
                  MAX_COUNT = CURRENT_COUNT
                  MODE_VALUE = ARR(I)
              END IF
          END IF
      END DO  
      MODE = MODE_VALUE
      END FUNCTION MODE