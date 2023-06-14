// String is value type in swift

let oneLine = "one line"

let multipleLine = 
    """
    easy to read,
    second line,
    spaces in code are ignored because all text's start point same as \"\"\"
        <- spaces are not ignored
    """
print(multipleLine)

// use backslash(\) to break a line to easy to read in code
let softWrappedQuotation = 
"""

The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."

"""
print(softWrappedQuotation)

print("# extended")
// You can place a string literal within extended delimiters to include special characters in a string without invoking their effect.
let threeString = 
#"""
nothing happens: """, \n
"""#
print(threeString)

// also use # to invoking in # extend
let fourString = #"Line1\#nLine2"#
print(fourString)