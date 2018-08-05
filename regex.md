Regular Expressions: General Reference
======================================

## Lookaround

__Positive Lookahead__

`(?=foo)`
> Assers that what immediately __follows__ the current position __is__ `foo`

__Negative Lookahead__

`(?!foo)`
> Asserts that what imediately __follows__ the current position __is not__ `foo`

__Positive Lookbehind__

`(?=foo)`
> Asserts that what immediately __precedes__ the current position __is__ `foo`

__Negative Lookbehind__

`(?<!foo)`
> Asserts that what immediately __precedes__ the current position __is not__ `foo`