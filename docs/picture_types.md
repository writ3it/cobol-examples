# PICTURE DATA TYPES

## GnuCobol ([source](https://gnucobol.sourceforge.io/faq/index.html#picture))

| Symbol | Description |
|:------:|-------------|
| A      | A character position for ALPHABETIC or SPACE |
| B      | A blank insertion |
| E      | Marks the start of an exponent for floating point values |
| N      | A NATIONAL character position |
| P      | An assumed decimal scaling postion |
| S      | An indicator of the presence of an operational sign |
| V      | An indicator of the location of an assumed decimcal point |
| X      | A character position for any character |
| Z      | A leading numeric character, space when zero |
| 9      | A character position for digits |
| 0      | A zero insertion |
| /      | A slash insertion |
| ,      | A comma insertion |
| .      | An editing symbol for decimal point alignment, and a period insertion |
| +      | A sign control symbol |
| -      | A sign control symbol |
| CR     | A sign control pair, displayed when value negative |
| DB     | A sign control pair, displayed when value negative |
| *      | A cheque protection symbol, leading zeroes replaced by asterisk |

Symbols are case insensitive.  CR, cr, Cr, cR are equivalent for example.

PICTURE clauses can also contain a valid currency picture, (default is
dollar sign) defined in the configuration section, special-names
paragraph. For example:

CURRENCY SIGN IS "CAD" PICTURE SYMBOL "c"
CURRENCY SIGN IS "CLP" PICTURE SYMBOL "C"

Currency sign picture symbols are case sensitive.  Currency picture
symbols are limited in that they cannot override the other predefined
symbols or some COBOL syntax symbols.