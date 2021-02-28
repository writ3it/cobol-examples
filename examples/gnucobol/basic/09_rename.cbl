       IDENTIFICATION DIVISION.
       PROGRAM-ID. 09_RENAME.
       
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 var-record.
               02 var-num1   PIC 9(10) VALUE zero.
               02 filler     PIC X VALUE " ".
               02 var-num2   PIC 9(10) VALUE zero.
               02 filler     PIC X VALUE " ".
               02 var-num3   PIC 9(10) VALUE zero.
               02 filler     PIC X VALUE " ".
               02 var-num4   PIC 9(10) VALUE zero.
               02 filler     PIC X VALUE " ".
               02 var-num5   PIC 9(10) VALUE zero.
               02 filler     PIC X VALUE " ".
               02 var-num6   PIC 9(10) VALUE zero.
           66 var-group RENAMES var-num1 THRU var-num3.
        
       PROCEDURE DIVISION.
           DISPLAY "Enter number 1: ".
           ACCEPT var-num1.
           DISPLAY "Enter number 2: ".
           ACCEPT var-num2.
           DISPLAY "Enter number 3: ".
           ACCEPT var-num3.
           DISPLAY "Enter number 4: ".
           ACCEPT var-num4.
           DISPLAY "Enter number 5: ".
           ACCEPT var-num5.
           DISPLAY "Enter number 6: ".
           ACCEPT var-num6.

           DISPLAY "var-group : ".
           DISPLAY var-group.
       STOP RUN.