# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
"""
helper funtion to decode part 1
takes the model and returns the hidden code for that line
"""
function _decode_part_1(model::MyPuzzleRecordModel)::Int64
     
    bools = isnumeric.(model.characters)
    numbers = model.characters[bools]
    
    # in numbers get first and lastdigit
    tmp = Array{Char,1}()
    push!(tmp, numbers[1])
    push!(tmp, numbers[end])

    # convert from char to int
    linecode = join(tmp)|> x-> parse(Int,x)

    return linecode
end
"""
helper function to decode part 2
takes the model, turns the number names into numbers, calls _decode_part_1,
then returns the hidden code for that line
"""
function _decode_part_2(model::MyPuzzleRecordModel)::Int64

    record = model.record
    
    # number word dictionary
    number_dict = Dict("one" => 1, 
                    "two" => 2, 
                    "three" => 3, 
                    "four" => 4, 
                    "five" => 5, 
                    "six" => 6, 
                    "seven" => 7, 
                    "eight" => 8, 
                    "nine" => 9, 
                    "zero" => 0)

    # first replace all of the number names with numerals
    for (number_names, numeral) in number_dict
        if occursin(number_names, record)
            
            # add a new start and end character to the word and replace the word with the new word. 
            # For example "eight" goes to "eeightt"
            first_char = string(number_names[1])
            last_char = string(number_names[end])
            replacement_word = "$(first_char)$(number_names)$(last_char)"
            
            # replace occurance of number name with replacement word
            # then replace the occurance of the number name with the numeral
            record = replace(record, number_names => replacement_word) |> x -> replace(x, number_names => numeral)
        end
    end

    # update the model
    model.record = record
    model.characters = collect(record)

    # now, we can use the _decode_part_1 function to parse the value -
    return _decode_part_1(model)
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
    codes = Dict{Int64, Int64}();

    for (l,m) in models
        
        codes[l] = _decode_part_1(m)
        total += codes[l]
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

        # initialize
        codes = Dict{Int64, Int64}()

        # decode
        codes[l] = _decode_part_2(m);
        total += codes[l];
    end    
    
    return (total, codes);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #