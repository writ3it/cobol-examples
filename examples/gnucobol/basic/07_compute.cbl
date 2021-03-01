       IDENTIFICATION DIVISION.
       PROGRAM-ID. 07_COMPUTE.
       
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 var-a   PIC 9(10)9 VALUE zero.
           01 var-b   PIC 9(10)9 VALUE zero.
           01 var-c   PIC 9(10)9 VALUE zero.
           01 var-x   PIC 9(10)9 VALUE zero.
           01 var-result PIC z(15)9.99 VALUE zero.
        
       PROCEDURE DIVISION.
           DISPLAY "Calc result of quadratic formula y = ax^2 + bx + c".
           DISPLAY spaces.

           DISPLAY "Enter a:"
           ACCEPT var-a.
           DISPLAY "Enter b:"
           ACCEPT var-b.
           DISPLAY "Enter c:"
           ACCEPT var-c.
           DISPLAY "Enter x:"
           ACCEPT var-x.

           COMPUTE var-result= var-a * var-x**2 + var-b*var-x + var-c.

           DISPLAY "y = "var-result.

       STOP RUN.
