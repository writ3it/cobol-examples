       IDENTIFICATION DIVISION.
       PROGRAM-ID. 02_LOOPS.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 counter PIC S9(9) VALUE 5.

       PROCEDURE DIVISION.

      * One step loop
           PERFORM
               DISPLAY 'HELLO WORLD'
           END-PERFORM.

      * Loop over paragraphs
           PERFORM B-PARAGRAPH THRU D-PARAGRAPH 2 TIMES.

           DISPLAY "=======".

           A-PARAGRAPH.
           DISPLAY 'A-PARATRAPH'.

           B-PARAGRAPH.
           DISPLAY 'B-PARATRAPH'.

           C-PARAGRAPH.
           DISPLAY 'C-PARATRAPH'.

           D-PARAGRAPH.
           DISPLAY 'D-PARATRAPH'.

           E-PARAGRAPH.
           DISPLAY 'E-PARATRAPH'.

       STOP RUN.


       