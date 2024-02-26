
# ===== PUBLIC METHODS BELOW HERE =================================================================================== #
"""
build_record_model(record::String) -> MyPuzzleRecordModel

Builds an instance of the `MyPuzzleRecordModel` type from a string

### Arguments
- `record::String`: the string being used to make the puzzle
"""
function build_record_model(record::String)::MyPuzzleRecordModel

    # check: should we check to see if the parameters are valid?
    @assert (typeof(record)==String)
    # Will this ever get called with invalid parameters?

    model = MyPuzzleRecordModel();
    len = length(record)
    model.len = len
    model.record = record
    model.characters = Array{Char, 1}(undef,len)
    for n in 1:len
        model.characters[n]=record[n]
    end
    
    return model;
end

# ===== PUBLIC METHODS ABOVE HERE =================================================================================== #