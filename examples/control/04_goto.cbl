       IDENTIFICATION DIVISION.
       PROGRAM-ID. 03_MORE_LOOPS.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 var-switch PIC 9(2) VALUE 1.

       PROCEDURE DIVISION.

      * GO TO :D

           GO TO PARA-NEXT.

           PARA-TO-SKIP.
           DISPLAY 'You never see that.'.

           PARA-NEXT.
           DISPLAY 'Hello in PARA-NEXT!'.

      * GO TO MONSTER HERE!

           DISPLAY "Enter number 1,2 or 3:"
           ACCEPT var-switch.

      * Choose paragraph depending on var-switch :) 
           GO TO PARA-1 PARA-2 PARA-3 DEPENDING ON var-switch.

           PARA-1.
           DISPLAY 'PARA-1'.

           PARA-2.
           DISPLAY 'PARA-2'.

           PARA-3.
           DISPLAY 'PARA-3'.


       STOP RUN.


       