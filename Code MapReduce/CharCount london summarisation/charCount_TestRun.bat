REM ===================================================================================
REM Windows batch script to locally test the MapReduce mapper and reducer functions
REM	The input is taken from a text file like this: <input_file.txt
REM	The output is written to a text file like this: >output_file.txt
REM 
REM This batch file should be placed in the same folder with the .py scripts
REM Make sure you change the paths and file names to match yours! 
REM ===================================================================================

REM Run mapper
"c:\Anaconda3\python.exe" charCountMapper.py <pg30123.txt >charCountMapper_output.txt

REM Sort the mapper output (in Hadoop the sorting operation is done by the master controller)
sort charCountMapper_output.txt /o charCountMapper_output_sorted.txt

REM Run reducer
"c:\Anaconda3\python.exe" charCountReducer.py <charCountMapper_output_sorted.txt >charCountReducer_output.txt



REM NOTE: If your .bat script is not in the same folder use specify full paths placed between "", for example:
REM "c:\Anaconda3\python.exe" "C:\Example\charCountMapper.py" <"C:\Example\pg30123_short.txt" >"C:\Example\charCountMapper_output.txt"


REM Wait for user to press a key
PAUSE