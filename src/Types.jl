"""
    MyPuzzleRecordModel

### Fields 
- `record::String`: a test string 
- `characters::Array{Char, 1}`: an array with each character individually indexed
- `len::Int64`: the length of the test string
"""
mutable struct MyPuzzleRecordModel
   
    # data fields 
    record::String
    characters::Array{Char, 1}
    len::Int64
        
    # constructor
    MyPuzzleRecordModel() = new()
end