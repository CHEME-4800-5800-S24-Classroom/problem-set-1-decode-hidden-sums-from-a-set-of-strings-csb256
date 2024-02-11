[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/7ga9B_m_)
# `PS1`: Decode Hidden Sums from a Set of Strings
Problem set 1 `(PS1)` gives students practice working with [Strings](https://docs.julialang.org/en/v1/manual/strings/#man-strings), [Characters](https://docs.julialang.org/en/v1/manual/strings/#man-characters), [Arrays](https://docs.julialang.org/en/v1/manual/arrays/#man-arrays-1), [Dictionaries](https://docs.julialang.org/en/v1/base/collections/#Base.Dict) and [Loops](https://docs.julialang.org/en/v1/manual/control-flow/#man-loops-1). `PS1` is divided into two parts and was inspired by the `2023 Day 1` [Advent of Code challenge](https://adventofcode.com/).

## Part 1
A document consists of lines of text, each containing a specific `integer` code that needs to be recovered. The code can be found by combining the `first digit` and the `last digit` (in that order) to form a single `two-digit integer`. The sum of all of these integers is the `hidden sum` that needs to be recovered.

For example, consider the following `4-lines` of encoded text, provided in the file `test_part_1.txt` in the `data` directory:
```
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
```

In this example, the code values of these four lines are `12`, `38`, `15`, and `77`. Adding these together produces `142`, the hidden sum.

### Tasks Part 1
The public `application programming interface (API)` for this problem set consists of the following types and functions:
1. Create the `MyPuzzleRecordModel` type in the `Types.jl` file. `MyPuzzleRecordModel` should be `mutable` and have three fields:       
    * The `record::String` field holds a single encoded line of text, 
    * The `characters::Array{Char, 1}` field holds the characters of the line of text, 
    * The `len::Int64` field which holds the length (number of characters) of the encoded line of text.
2. Create a `build` method in the `Factory.jl` file that takes in an encoded line of text and returns a `MyPuzzleRecordModel` object (with all the fields populated).
3. Complete the implementation of the `puzzleparse` method in the `Files.jl` file. The `puzzleparse` method takes a file path as input and returns a 
[Dictionary](https://docs.julialang.org/en/v1/base/collections/#Base.Dict) with the following structure:
   - The `key` should be the line number (starting from index 1), and the `value` should be a `MyPuzzleRecordModel` instance holding the encoded line of text.
4. Complete the implementation of the `decode_part_1` method in the `Compute.jl` file. The `decode_part_1` method takes `models::Dict{Int64, MyPuzzleRecordModel}` as input and returns a [Tuple](https://docs.julialang.org/en/v1/manual/functions/#Tuples) with two elements:
   - The `first` element should be the overall `hidden sum` computed by processing `all` the encoded text in a file. The `hidden sum` is  of the type `Int64`.
   - The `second` element should be a dictionary of type `Dict{Int64, Int64}` with the following structure: The `key` should be the line number (starting from index 1), and the `value` should be the `two-digit integer` computed from the `first digit` and the `last digit` of the encoded line of text.

Use the `testme_part_1.jl` script to test your implementation. This checks the implementation of the methods developed above and the final value of the hidden sum on the `production.txt` data file. The `hidden sum` should be `55172`.

## Part 2
As it turns out, your calculation from [Part 1](#part-1) wasn't quite correct. Some of the digits are spelled out with letters: `one,` `two,` `three,` `four,` `five,` `six,` `seven,` `eight,` and `nine` also count as valid `digits.` Given this new information, you now need to find the actual   `first` and `last` digits on each line, where we consider both numerical digits and words. The sum of these integers is the `true hidden sum` that needs to be recovered.

For example, consider the following `8-lines` of encoded text, provided in the `test_part_2.txt` file in the `data` directory:
```
two1nine
eightwothree
onetwoneight
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
```
In this example, the code values are `29`, `83`, `18`,`13`, `24`, `42`, `14`, and `76`. Adding these `codes` together produces `299`, the `true hidden sum.` 
* `Interesting wrinkle`: The `3rd` and `7th` lines contain `frameshift` edge cases, i.e., where the numerical words are combined with single overlapping characters at the start and end of the word, e.g., `twone,` `oneight` or `sevenine.` Your code needs to handle `frameshift` cases.

### Tasks Part 2
We can use all of the types and functions from [Part 1](#part-1) to solve this problem, except the `decode_part_1` function because it is not looking for numerical words. Thus, we need to construct a new function which considers both numerical digits and words:
    
1. Complete the implementation of the `decode_part_2` method in the `Compute.jl` file. The `decode_part_2` method takes `models::Dict{Int64, MyPuzzleRecordModel}` as input and returns a [Tuple](https://docs.julialang.org/en/v1/manual/functions/#Tuples) with two elements:
   - The `first` element should be the overall `hidden sum` computed by processing `all` the encoded text in a file. The `hidden sum` is  of the type `Int64`.
   - The `second` element should be a dictionary of type `Dict{Int64, Int64}` with the following structure: The `key` should be the line number (starting from index 1), and the `value` should be the `two-digit integer` computed from the `first digit` and the `last digit` of the encoded line of text.

Use the `testme_part_2.jl` script to test your implementation for [Part 2](#part-2). This script checks the implementation of the methods developed above and `decode_part_2` and computes the final value of the `true hidden sum` using the `production.txt` data file. The `true hidden sum` is `54925`.

