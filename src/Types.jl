"""
    MyPuzzleRecordModel

TODO: Add documentation
"""
# TODO: Finish the MyPuzzleRecordModel type
mutable struct MyPuzzleRecordModel
   
    # data fields 
    record::String
    characters::Array{Char, 1}
    len::Int64
        
    # constructor
    # MyPuzzleRecordModel(record::String, characters::Array{Char, 1}, len::Int64) = new()
    MyPuzzleRecordModel() = new()

end