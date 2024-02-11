include("Include.jl")


# ----------------------------------------------------------------------------------
# for more information on tests, see: https://docs.julialang.org/en/v1/stdlib/Test/
# ----------------------------------------------------------------------------------

# Testset - let's write a unit test for each *public* function in our code!
@testset verbose = true "PS1 Test Suite Part 2" begin

    @testset "decode_part_2 with test_part_2.txt" begin
        
        # setup -
        path_to_test_file = joinpath(_PATH_TO_DATA, "test_part_2.txt");
        number_of_test_records = 8;
        
        # load the test file -
        d = puzzleparse(path_to_test_file);

        # this should an array of 4 records, with type MyPuzzleRecordModel
        @test length(d) == number_of_test_records;

        # check the type of the records -
        @test typeof(d) == Dict{Int64,MyPuzzleRecordModel}

        # decode the records -
        (total, codes) = decode_part_2(d);

        # the total for production.txt should be 299
        @test total == 299;
    end

    @testset "decode_part_2 with production.txt" begin
        
        # setup -
        path_to_production_file = joinpath(_PATH_TO_DATA, "production.txt");
        number_of_production_records = 1000;
        
        # load the test file -
        d = puzzleparse(path_to_production_file);

        # this should an array of 4 records, with type MyPuzzleRecordModel
        @test length(d) == number_of_production_records;

        # check the type of the records -
        @test typeof(d) == Dict{Int64,MyPuzzleRecordModel}

        # decode the records -
        (total, codes) = decode_part_2(d);

        # the total for production.txt should be 54925
        @test total == 54925;
    end
end