      * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      * DO NOT RUN THIS FILE, SEE 01_call_main.cbl
      * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

       IDENTIFICATION DIVISION.
       PROGRAM-ID. 01_call_subroutine.

       DATA DIVISION.
           LINKAGE SECTION.
           01 LS-NUMBER PIC 9(4).
           01 LS-STRING PIC A(15).

       PROCEDURE DIVISION USING LS-NUMBER, LS-STRING.
           DISPLAY 'Hello subroutine!'.
           DISPLAY 'String data: 'LS-STRING.
           MOVE 3721 TO LS-NUMBER.
       EXIT PROGRAM.
