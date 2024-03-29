       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEAP.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-RESULT  PIC 9.
       01 WS-YEAR USAGE UNSIGNED-INT.
       01 WS-TEMP USAGE UNSIGNED-INT.
       01 WS-CHECKS.
           02 LEAP-REMAINDER USAGE UNSIGNED-INT.
               88 IS-LEAP VALUE 0.
           02 CENTURY-REMAINDER USAGE UNSIGNED-INT.
               88 IS-CENTURY VALUE 0.
           02 LEAP-CENTURY-REMAINDER USAGE UNSIGNED-INT.
               88 IS-LEAP-CENTURY VALUE 0.

       PROCEDURE DIVISION.
       LEAP.
           MOVE 0 TO WS-RESULT.

           DIVIDE WS-YEAR BY 4   GIVING WS-TEMP REMAINDER LEAP-REMAINDER.
           DIVIDE WS-YEAR BY 100 GIVING WS-TEMP REMAINDER CENTURY-REMAINDER.
           DIVIDE WS-YEAR BY 400 GIVING WS-TEMP REMAINDER LEAP-CENTURY-REMAINDER.

           IF IS-LEAP AND (NOT IS-CENTURY OR IS-LEAP-CENTURY) THEN
               MOVE 1 TO WS-RESULT
           END-IF.
