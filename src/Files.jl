
# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    puzzleparse(filename::String) -> Dict{Int64, MyPuzzleRecordModel}

Reads a file from the path, and returns an instance of the `MyMoviewReviewDocumentModel` type.

### Arguments
- `filename::String`: the name of the file with the test strings
"""
function puzzleparse(filename::String)::Dict{Int64, MyPuzzleRecordModel}
    
    # initialize
    records = Dict{Int64, MyPuzzleRecordModel}()
    linecounter = 1;
    
    open(filename, "r") do io
        for line ∈ eachline(io)
            
            records[linecounter] = build_record_model(line)
            linecounter += 1

        end
    end

    # return the header and the records -
    return records;
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #