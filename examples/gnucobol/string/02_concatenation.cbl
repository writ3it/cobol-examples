       IDENTIFICATION DIVISION.
       PROGRAM-ID. 02_CONCATENATION.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 var-str1 PIC X(10) VALUE 'HELLO!'.
           01 var-str2 PIC X(10) VALUE 'HELLO!'.
           01 var-str-out PIC X(20) VALUE ' '.
           01 var-count PIC 99 VALUE 1.

       PROCEDURE DIVISION.
           
      
           DISPLAY 'Type your name:'
           ACCEPT var-str1.

           DISPLAY 'Type your surname:'
           ACCEPT var-str2.

           STRING var-str2 DELIMITED BY SIZE
                  var-str1 DELIMITED BY space
                  INTO var-str-out
                  WITH POINTER var-count
                  ON OVERFLOW DISPLAY 'String overflow!'
           END-STRING.

           DISPLAY "str: "var-str-out.
           DISPLAY "length: "var-count.

       STOP RUN.


       