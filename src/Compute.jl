# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
function _decode_part_1(model::MyPuzzleRecordModel)::Int64
     
    # for this line, get the characters -
    characters = model.characters;
    digits = filter(isnumeric, characters);
    value = Array{Char, 1}();
    push!(value, digits[1]);
    push!(value, digits[end]);


    # join the characters and parse the value -
    return value |> join |> x-> parse(Int64, x);
end

function _decode_part_2(model::MyPuzzleRecordModel)::Int64

    record = model.record
    
    # number word dictionary
    nums_dict = Dict(
    "one" => 1, 
    "two" => 2, 
    "three" => 3, 
    "four" => 4, 
    "five" => 5, 
    "six" => 6, 
    "seven" => 7, 
    "eight" => 8, 
    "nine" => 9, 
    "zero" => 0)
    
    # let's replace the words with the numbers. If we have a number in word form, then add a new start and end character to the word
    # and replace the word with the new word.  For example "eight" goes to "eeightt". So if we had a word like "eightwo"
    # then we would have "eeighttwoo". We'll then replace the word with the number.  In this example, we'd have e8t2o.
    # once all the numbers are replaced, we can then use the _decode_part_1 function to parse the value
    for (word, number) in nums_dict
        if occursin(word, record)
            
            # replace the word with a modified varient -
            first_char = word[1] |> string;
            last_char = word[end] |> string;
            replacement_word = "$(first_char)$(word)$(last_char)";
            record = replace(record, word => replacement_word) |> x -> replace(x, word => number);
        end
    end

    # update the model -
    model.record = record;
    model.characters = collect(record);

    # now, we can use the _decode_part_1 function to parse the value -
    return _decode_part_1(model);
end
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #               

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
    codes = Dict{Int64, Int64}();
    
    for (l,m) in models

        codes = Dict{Int64, Int64}()
        
        # # Iterate over each word in the line
        # for (name,num) in models
        
        #     # Check if the word is a number word
        #     if occursin(name, m.record)
                
        #         # Replace the word with its corresponding index in the nums list
        #         num = string(findfirst(x -> x == num, nums) + 1)
        #         append!(digits, num)  # Append the digit to the array of digits
                
        #     end
        #     codes[name]
        # end
        
        # # Calculate the sum of the first and last digits
        # line_sum = parse(Int, digits[1] * digits[end])
        # line_sums[l] = line_sum

        # decode the value -
        codes[l] = _decode_part_2(m);
 
        # total the value -
        total += codes[l];
  
    end    
    
    return (total, codes);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #