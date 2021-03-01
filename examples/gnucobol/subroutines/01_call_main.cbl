      * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      * MAIN FILE - EXECUTE THIS
      * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

       IDENTIFICATION DIVISION.
       PROGRAM-ID. 01_MAIN.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 WS-NUMBER PIC 9(4) VALUE 1234.
           01 WS-STRING PIC A(15) VALUE 'Some string'.

       PROCEDURE DIVISION.

           DISPLAY 'Before CALL BY: '.
           DISPLAY 'Number: 'WS-NUMBER.
           DISPLAY 'String: 'WS-STRING.

           display spaces.
           
           CALL '01_call_subroutine' USING WS-NUMBER, WS-STRING.
           
           display spaces.

           DISPLAY 'After CALL BY REFERENCE: '.
           DISPLAY 'Number: 'WS-NUMBER.
           DISPLAY 'String: 'WS-STRING.


           MOVE 1234 TO WS-NUMBER.

           display spaces.
           
           CALL '01_call_subroutine' USING BY CONTENT WS-NUMBER, 
           WS-STRING.
           
           display spaces.

           DISPLAY 'After CALL BY CONTENT: '.
           DISPLAY 'Number: 'WS-NUMBER.
           DISPLAY 'String: 'WS-STRING.

       STOP RUN.
