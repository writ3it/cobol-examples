       IDENTIFICATION DIVISION.
       PROGRAM-ID. 01_IF.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01  var-num1 PIC 9(9) VALUE 0.
           01  var-num2 PIC 9(9) VALUE 1.


       PROCEDURE DIVISION.

           DISPLAY 'ENTER number 1: '
           ACCEPT var-num1.

           DISPLAY 'ENTER number 2: '
           ACCEPT var-num2.

           IF var-num1>var-num2 THEN
               DISPLAY 'Number1 is greater than Number2'
           ELSE
               IF var-num1 = var-num2 THEN
                   DISPLAY 'Number1 equals Number2'
               ELSE
                   DISPLAY 'Number1 is less than Number2'
               END-IF
           END-IF.

       STOP RUN.


       