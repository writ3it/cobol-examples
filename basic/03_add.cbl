       IDENTIFICATION DIVISION.
       PROGRAM-ID. 03_ADDING.
       
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 var-num1   PIC 9(10) VALUE zero.
           01 var-num2   PIC 9(10) VALUE zero.
           01 var-result PIC z(9)9 VALUE zero.
        
       PROCEDURE DIVISION.
           DISPLAY "Enter number 1: ".
           ACCEPT var-num1.
           DISPLAY "Enter number 2: ".
           ACCEPT var-num2.

           ADD var-num1 TO var-num2 GIVING var-result.
 
           DISPLAY "Result : "var-result.
       STOP RUN.
