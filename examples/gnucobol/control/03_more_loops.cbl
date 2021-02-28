       IDENTIFICATION DIVISION.
       PROGRAM-ID. 03_MORE_LOOPS.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 counter PIC 9(2) VALUE 0.

       PROCEDURE DIVISION.

      * Loop n times
           PERFORM 3 times
               DISPLAY 'Hello world #1'
           END-PERFORM.

           DISPLAY spaces.

      * Loop like do-while but condition is inversed
           MOVE 0 TO counter.

           PERFORM UNTIL counter = 3
           DISPLAY "Hello World #2"
           ADD 1 TO counter
           END-PERFORM.

           DISPLAY spaces.

      * Loop like while-do but condition is inversed
           MOVE 0 TO counter.

           PERFORM WITH TEST BEFORE UNTIL counter = 3
           DISPLAY "Hello World #3"
           ADD 1 TO counter
           END-PERFORM.

           DISPLAY spaces.

      * Loop like for-loop 

           MOVE 0 TO counter.

           PERFORM VARYING counter FROM 1 BY 1 UNTIL counter=4       
           DISPLAY "Hello World #4"
           END-PERFORM.

           DISPLAY spaces.

       STOP RUN.


       