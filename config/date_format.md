
Config: Date Format
===================


<!-- MarkdownTOC -->

- [Overview](#overview)
- [Format](#format)
	- [__Explanation__](#__explanation__)
- [Arguments](#arguments)

<!-- /MarkdownTOC -->


## Overview

The format of the date that's usually displayed on the taskbar

For more information see `date manpage`


## Format


__Config__
```
%a, %b(%m) %d, %Y%t-%t%H:%M:%S %p
```

__Displayed Value__
> Mon, Jan(1), 2000		HH:MM:SS AM

#### __Explanation__
| Argument | Value                         |
| -------- | -----                         |
| % a      | Day Abbreviation - Mon        |
| % b      | Month Abbreviation - Jan      |
| % m      | Month Numeric Value - Jan = 1 |
| % d      | Day of the Month - 30         |
| % Y      | Year - YYYY                   |
| % t      | tab - \t                      |
| % H      | Hour(12hr) - 12               |
| % M      | Minute - 60                   |
| % S      | Seconds - 60                  |
| % p      | AM/PM = AM                    |

## Arguments

```config

 FORMAT controls the output.  Interpreted sequences are:

       %%     a literal %

       %a     locale's abbreviated weekday name (e.g., Sun)

       %A     locale's full weekday name (e.g., Sunday)

       %b     locale's abbreviated month name (e.g., Jan)

       %B     locale's full month name (e.g., January)

       %c     locale's date and time (e.g., Thu Mar  3 23:05:25 2005)

       %C     century; like %Y, except omit last two digits (e.g., 20)

       %d     day of month (e.g., 01)

       %D     date; same as %m/%d/%y

       %e     day of month, space padded; same as %_d

       %F     full date; same as %Y-%m-%d

       %g     last two digits of year of ISO week number (see %G)

       %G     year of ISO week number (see %V); normally useful only with %V

       %h     same as %b

       %H     hour (00..23)

       %I     hour (01..12)

       %j     day of year (001..366)

       %k     hour, space padded ( 0..23); same as %_H

       %l     hour, space padded ( 1..12); same as %_I

       %m     month (01..12)

       %M     minute (00..59)

       %n     a newline

       %N     nanoseconds (000000000..999999999)

       %p     locale's equivalent of either AM or PM; blank if not known

       %P     like %p, but lower case

       %r     locale's 12-hour clock time (e.g., 11:11:04 PM)

       %R     24-hour hour and minute; same as %H:%M

       %s     seconds since 1970-01-01 00:00:00 UTC

       %S     second (00..60)

       %t     a tab

       %T     time; same as %H:%M:%S

       %u     day of week (1..7); 1 is Monday

       %U     week number of year, with Sunday as first day of week (00..53)

       %V     ISO week number, with Monday as first day of week (01..53)

       %w     day of week (0..6); 0 is Sunday

       %W     week number of year, with Monday as first day of week (00..53)

       %x     locale's date representation (e.g., 12/31/99)

       %X     locale's time representation (e.g., 23:13:48)

       %y     last two digits of year (00..99)

       %Y     year

       %z     +hhmm numeric time zone (e.g., -0400)

       %:z    +hh:mm numeric time zone (e.g., -04:00)

       %::z   +hh:mm:ss numeric time zone (e.g., -04:00:00)

       %:::z  numeric time zone with : to necessary precision (e.g., -04,
              +05:30)

       %Z     alphabetic time zone abbreviation (e.g., EDT)

       By default, date pads numeric fields with zeroes.  The following
       optional flags may follow '%':

       -      (hyphen) do not pad the field

       _      (underscore) pad with spaces

       0      (zero) pad with zeros

       ^      use upper case if possible

       #      use opposite case if possible

       After any flags comes an optional field width, as a decimal number;
       then an optional modifier, which is either E to use the locale's
       alternate representations if available, or O to use the locale's
       alternate numeric symbols if available.
EXAMPLES         top

       Convert seconds since the epoch (1970-01-01 UTC) to a date

              $ date --date='@2147483647'

       Show the time on the west coast of the US (use tzselect(1) to find
       TZ)

              $ TZ='America/Los_Angeles' date

       Show the local time for 9AM next Friday on the west coast of the US

              $ date --date='TZ="America/Los_Angeles" 09:00 next Fri'
DATE STRING         top

       The --date=STRING is a mostly free format human readable date string
       such as "Sun, 29 Feb 2004 16:21:42 -0800" or "2004-02-29 16:21:42" or
       even "next Thursday".  A date string may contain items indicating
       calendar date, time of day, time zone, day of week, relative time,
       relative date, and numbers.  An empty string indicates the beginning
       of the day.  The date string format is more complex than is easily
       documented here but is fully described in the info documentation.

```
