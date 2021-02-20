       IDENTIFICATION DIVISION.
       PROGRAM-ID. 01_INSPECT.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 var-str PIC X(10) VALUE 'HELLO!'.
           01 var-length PIC 9(5) VALUE 0.

       PROCEDURE DIVISION.
           
      
           DISPLAY 'Enter some string:'
           ACCEPT var-str.

      * Tallying
           MOVE 0 TO var-length.
           INSPECT var-str TALLYING var-length FOR CHARACTERS.
           DISPLAY "Length: "var-length.

           MOVE 0 TO var-length.
           INSPECT var-str TALLYING var-length FOR ALL space.
           DISPLAY "Spaces: "var-length.

      * Replacing
           INSPECT var-str REPLACING ALL 'a' BY 'z'.
           DISPLAY "Str: "var-str.

       STOP RUN.


       