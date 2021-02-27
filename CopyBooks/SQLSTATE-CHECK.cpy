       SQLSTATE-CHECK SECTION.
           IF SQLCODE < 0
                      DISPLAY 'SQLSTATE='  SQLSTATE,
                              ', SQLCODE=' SQLCODE
              IF SQLERRML > 0
                 DISPLAY 'SQL Error message:' SQLERRMC(1:SQLERRML)
              END-IF
              MOVE SQLCODE TO RETURN-CODE
              STOP RUN
           ELSE IF SQLCODE > 0 AND NOT = 100
                      DISPLAY 'SQLSTATE='  SQLSTATE,
                              ', SQLCODE=' SQLCODE
              IF SQLERRML > 0
                 DISPLAY 'SQL Warning message:' SQLERRMC(1:SQLERRML)
              END-IF
           END-IF.
