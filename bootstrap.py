"""
This file is part of proj-doc-tree.

proj-doc-tree is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

proj-doc-tree is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with proj-doc-tree. If not, see <https://www.gnu.org/licenses/>.
"""

import os
import argparse
import sys

def validate_directories(input_dir, output_dir):
    """
    Validate the input and output directories.

    Parameters:
    input_dir (str): The directory to read files from.
    output_dir (str): The directory to write the files to.

    Raises:
    SystemExit: If the input directory does not exist, the output directory is not empty, 
                or the parent directory of the output directory does not exist.
    """
    errors = []

    if not os.path.isdir(input_dir):
        errors.append(f"Error: Input directory '{input_dir}' does not exist.")
    
    if os.path.exists(output_dir):
        if os.listdir(output_dir):
            errors.append(f"Error: Output directory '{output_dir}' is not empty.")
    else:
        parent_dir = os.path.dirname(output_dir)
        if not os.path.isdir(parent_dir):
            errors.append(f"Error: Parent directory '{parent_dir}' does not exist.")
    
    if errors:
        for error in errors:
            print(error)
        sys.exit(1)

def clone_structure(input_dir, output_dir):
    """
    Read files from the input directory and write their content to the output directory,
    maintaining the relative directory structure.

    Parameters:
    input_dir (str): The directory to read files from.
    output_dir (str): The directory to write the files to.
    """
    for root, dirs, files in os.walk(input_dir):
        for file in files:
            file_path = os.path.join(root, file)
            relative_path = os.path.relpath(file_path, input_dir)
            output_file_path = os.path.join(output_dir, relative_path)
            
            os.makedirs(os.path.dirname(output_file_path), exist_ok=True)
            
            with open(file_path, 'r') as infile, open(output_file_path, 'w') as outfile:
                for line in infile:
                    outfile.write(line)
    print("All work by the script is complete.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Read files from a directory and write their content to an output directory, maintaining the relative directory structure.")
    parser.add_argument('input_directory', type=str, help="The directory to read files from.")
    parser.add_argument('output_directory', type=str, help="The directory to write the files to.")
    
    args = parser.parse_args()
    
    validate_directories(args.input_directory, args.output_directory)
    clone_structure(args.input_directory, args.output_directory)
