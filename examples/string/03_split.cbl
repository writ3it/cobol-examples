       IDENTIFICATION DIVISION.
       PROGRAM-ID. 03_SPLIT.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 var-long-str PIC X(20) VALUE 'HELLO!'.
           01 var-name PIC X(20) VALUE 'name'.
           01 var-surname PIC X(20) VALUE 'name'.
           01 var-rest PIC X(20).

       PROCEDURE DIVISION.
           
      
           DISPLAY 'Type your name and surname (use space as delimiter)'
           ACCEPT var-long-str.
           
           UNSTRING var-long-str DELIMITED BY space
               INTO var-name, var-surname, var-rest
      *        ON OVERFLOW DISPLAY 'Too many characters!'
      *        NOT ON OVERFLOW DISPLAY 'Perfect!'
           END-UNSTRING.

           DISPLAY "Name: "var-name.
           DISPLAY "Surame: "var-surname.

       STOP RUN.


       