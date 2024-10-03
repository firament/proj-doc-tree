
## ChatGPT run
```
Create a python script that 

will take as parameters an input directory and an output directory
The tree structure of the input directory will be replicated in the output directory

perform validations,
input directory exists
Output directory exists and is empty, create it if it does not exist
Collect all errors and exit after validation if any errors exist.

For the given input directory
iterate through the directory and all its nested subdirectories
for each file in each directory,
if the file is a markdown file or a sql script copy the contents line by line to a file in the output directory
if the file is any other copy the binary contents

add a help option

add code documentation
```


## Copilot run
> https://copilot.microsoft.com/
> Instructions used to generate code in file `bootstrap.py`

```
Create a python script that will iterate through a given directory and all its subdirectories.
In each directory read any file in it line by line and write the content line by line to a file in the given location

parameterize the input and output directories

add validation to confirm the input directory exists, 
and for output directory 
1. if it exists, that it is empty
2. If it does not exist, the parent directory exists

add a help option

add code documentation that pydoc can read

can you change function name read_and_write_files to clone_structure

In validate_directories instead of exiting at each error, list all errors at the end and exit if any errors exist

Add a message at the end to let user know that all work by the script is complete

update clone_structure to take output folder rather than file name
and modify the function to write the contents of the file to a relative path, similar to the input path

Thank you. That was most helpful.
```
