# magicDateExtension

### Introduction

    Make your life easier than before with magicDateExtension just type Date(). and control+spacebar will bring everything you need.

    Useful date and time format

    README DATE FORMAT

    y = 2014            E,EE,EEE = Wed
    yy = 14             EEEE     = Wednesday
    yyy = 2014          EEEEE    = W
    yyyy = 2014         EEEEEE   = We

    M = 7
    MM = 07
    MMM = Jul
    MMMM = July

    d = 4
    dd = 04

    README TIME FORMAT

    h = 1-12 based hour
    H = 0-23 based hour

    m = minute at least 1 digit
    mm = minute at least 2 digit

    s = second at least 1 digit
    ss = second at least 2 digit

    S, SS = fractional second (Tenths place)
    SSS = fractional second (Tenths, hundredths and thousanths place)


### Installation

    Create new file name dateExtension.swift then copy all the code into that file and build project then you good to go.


### How To use

**1)  GET CURRENT DATE AND/OR TIME WITH CUSTOM FORMAT**

  * currentDateTime(with stringFormat: String) -> String

        Example: Date().currentDateTime(with "dd/MM/yyyy")

**2)  REFORMAT DATE OR DATE STRING TO ANOTHER DATE STRING FORMAT**

  * reFormat(with dateString: String, toFormat: String) -> String

        Example: Date().reFormat(with "23-10-2018", toFormat: "dd/MM/yyyy")

  * reFormat(with date: Date, toFormat: String) -> String

        Example: Date().reFormat(with Date, toFormat: "dd/MM/yyyy")

  * dateFrom(string: String) -> Date

        Example: Date().dateFrom(string: "23/10/2018")

**3)  CALCULATE ESTIMATE TIME WITH INPUT MINUTE**

  * estimateTime(min: Int, withFormat: String) -> String

        Example: Date().estimateTime(min: 20, withFormat: "dd/MM/yyyy HH:mm:ss") This will return current time + 20 minute as input format


## License ##

    MIT License

    Copyright (c) 2018 Chantanat Sensupa

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
