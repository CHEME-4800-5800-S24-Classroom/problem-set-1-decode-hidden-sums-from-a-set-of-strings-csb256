# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

finds the hidden sum (sum of the first and last digit) in the string. 

### Arguments
- `models::Dict{Int64, MyPuzzleRecordModel}`: the instance of MyPuzzleRecordModel being decoded
"""
function decode_part_1(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
    
    # initialize -
    total = 0;
    linecode = 0;
    codes = Dict{Int64, Int64}();

    for (linenum,modelnum) in models
        
        bools = isnumeric.(modelnum.characters)
        numbers = modelnum.characters[bools]
        
        # in numbers get first and lastdigit
        tmp = Array{Char,1}()
        push!(tmp, numbers[1])
        push!(tmp, numbers[end])

        # convert from char to int
        linecode = join(tmp)|> x-> parse(Int,x)

        total += linecode
        codes[linenum]=linecode
    
    end

    return (total, codes);
end

"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

finds the hidden sum (sum of the first and last digit or written number) in the string. 

### Arguments
- `models::Dict{Int64, MyPuzzleRecordModel}`: the instance of MyPuzzleRecordModel being decoded
"""
function decode_part_2(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
     
    # initialize -
    total = 0;
    line_sums = Dict{Int64, Int64}();
    
    for (l,m) in models

        digits = []
        
        # Define a string containing numbers spelled out in words separated by '|' characters
        nums_str = "one|two|three|four|five|six|seven|eight|nine"
        
        # Split the nums string into a list of individual number words
        nums = split(nums_str, '|')
        
        # Iterate over each word in the line
        for num in nums
        
            # Check if the word is a number word
            if occursin(num, m.record)
                
                # Replace the word with its corresponding index in the nums list
                num = string(findfirst(x -> x == num, nums) + 1)
                append!(digits, num)  # Append the digit to the array of digits
            end
        end
        
        # Calculate the sum of the first and last digits
        line_sum = parse(Int, digits[1] * digits[end])
        line_sums[l] = line_sum

        # Add to the total sum
        total += line_sum
    end
    
    return (total, line_sums);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #