REM Locally test topTenCars mapper and reducer

REM Run mapper on 1st data split, output to file
type split1.txt | Mapper.py > Mapper_output.txt

REM Run mapper on 2nd data split, append to the same file
type split2.txt | Mapper.py >> Mapper_output.txt

REM View the output of the mappers (sorted)
type Mapper_output.txt | sort

REM Run the reducer
type Mapper_output.txt | sort | Reducer.py

REM Run the reducer, output to file
type Mapper_output.txt | sort | Reducer.py > Reducer_output.txt

REM Wait for user to press a key
PAUSE