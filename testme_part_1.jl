include("Include.jl")


# ----------------------------------------------------------------------------------
# for more information on tests, see: https://docs.julialang.org/en/v1/stdlib/Test/
# ----------------------------------------------------------------------------------

# Testset - let's write a unit test for each *public* function in our code!
@testset verbose = true "PS1 Test Suite Part 1" begin

    @testset "puzzleparse with test_part_1.txt" begin
        
        # setup -
        path_to_test_file = joinpath(_PATH_TO_DATA, "test_part_1.txt");
        number_of_test_records = 4;
        
        # load the test file -
        d = puzzleparse(path_to_test_file);

        # this should an array of 4 records, with type MyPuzzleRecordModel
        @test length(d) == number_of_test_records;

        # check the type of the records -
        @test typeof(d) == Dict{Int64,MyPuzzleRecordModel}
    end

    @testset "decode_part_1 with test_part_1.txt" begin
        
        # setup -
        path_to_test_file = joinpath(_PATH_TO_DATA, "test_part_1.txt");

        # load the test file -
        d = puzzleparse(path_to_test_file);
    
        # decode the records -
        (total, codes) = decode_part_1(d);

        # the total for test.txt should be 142
        @test total == 142;
    end

    @testset "decode_part_1 with production.txt" begin
        
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
        (total, codes) = decode_part_1(d);

        # the total for production.txt should be 55172
        @test total == 55172;
    end
end