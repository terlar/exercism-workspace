       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEAP.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-RESULT PIC 9(1).
       01 WS-YEAR   PIC 9(4).
       01 X         PIC 9(4).
       01 DIV4R     PIC 9(4).
       01 DIV100R   PIC 9(4).
       01 DIV400R   PIC 9(4).

       PROCEDURE DIVISION.
       LEAP.
           DIVIDE WS-YEAR BY 4 GIVING X REMAINDER DIV4R
           DIVIDE WS-YEAR BY 100 GIVING X REMAINDER DIV100R
           DIVIDE WS-YEAR BY 400 GIVING X REMAINDER DIV400R

           IF DIV100R IS ZERO THEN
               IF DIV400R IS ZERO THEN
                   MOVE 1 TO WS-RESULT
               ELSE
                   MOVE 0 TO WS-RESULT
               END-IF
           ELSE
               IF DIV4R IS ZERO THEN
                   MOVE 1 TO WS-RESULT
               ELSE
                   MOVE 0 TO WS-RESULT
               END-IF
           END-IF.
