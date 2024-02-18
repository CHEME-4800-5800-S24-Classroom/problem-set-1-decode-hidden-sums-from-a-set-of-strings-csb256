
# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE =================================================================================== #
# TODO: Make a build method to construct MyPuzzleRecordModel types

function build_record_model(record::String)::MyPuzzleRecordModel

    # check: should we check to see if the parameters are valid?
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