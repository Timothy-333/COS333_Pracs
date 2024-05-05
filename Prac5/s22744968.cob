IDENTIFICATION DIVISION.
PROGRAM-ID. stats.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 arr PIC 9(5) OCCURS 5 TIMES.
01 i PIC 9(5).
01 smallest PIC 9(5).
01 largest PIC 9(5).
01 modeValue PIC 9(5).
01 currentCount PIC 9(5).
01 j PIC 9(5).
01 maxCount PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
PERFORM readData.
PERFORM findSmallest.
DISPLAY "Smallest: " smallest.
PERFORM findLargest.
DISPLAY "Largest: " largest.
PERFORM findMode.
DISPLAY "Mode: " modeValue.
STOP RUN.

readData.
DISPLAY "Enter 5 numbers:".
PERFORM VARYING i FROM 1 BY 1 UNTIL i > 5
    ACCEPT arr(i)
END-PERFORM.

findSmallest.
MOVE arr(1) TO smallest.
PERFORM VARYING i FROM 2 BY 1 UNTIL i > 5
    IF arr(i) < smallest THEN
        MOVE arr(i) TO smallest
    END-IF
END-PERFORM.

findLargest.
MOVE arr(1) TO largest.
PERFORM VARYING i FROM 2 BY 1 UNTIL i > 5
    IF arr(i) > largest THEN
        MOVE arr(i) TO largest
    END-IF
END-PERFORM.

findMode.
MOVE 0 TO maxCount.
PERFORM VARYING i FROM 1 BY 1 UNTIL i > 5
    MOVE 1 TO currentCount
    COMPUTE j = i + 1
    PERFORM VARYING j FROM j BY 1 UNTIL j > 5
        IF arr(i) = arr(j) THEN
            ADD 1 TO currentCount
        END-IF
    END-PERFORM
    IF currentCount > maxCount THEN
        MOVE currentCount TO maxCount
        MOVE arr(i) TO modeValue
    END-IF
END-PERFORM.
