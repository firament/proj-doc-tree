#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# GNU General Public License v3.0
# 
# This file is part of proj-doc-tree.
# 
# proj-doc-tree is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# proj-doc-tree is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with proj-doc-tree.  If not, see <https://www.gnu.org/licenses/>.

# # Chat GPT input
# Create a python script that 
# 
# will take as parameters an input directory and an output directory
# The tree structure of the input directory will be replicated in the output directory
# 
# perform validations,
# input directory exists
# Output directory exists and is empty, or create one if it does not exist
# collect all errors and exit after validation if any errors exist.
# 
# For the given input directory
# iterate through the directory and all its subdirectories
# for each file in each directory,
# if the file is a markdown file or a sql script copy the contents line by line to a file n the output directory
# if the file is any other copy the binary contents
# 
# add a help option
# 
# add code documentation that pydoc can read
# 

import os
import shutil
import argparse

def validate_directories(input_dir, output_dir):
    """Validate input and output directories.

    Args:
        input_dir (str): Path to the input directory.
        output_dir (str): Path to the output directory.

    Returns:
        list: A list of error messages, empty if no errors are found.
    """
    errors = []

    if not os.path.isdir(input_dir):
        errors.append(f"Input directory '{input_dir}' does not exist.")
    
    if os.path.exists(output_dir):
        if not os.path.isdir(output_dir):
            errors.append(f"Output path '{output_dir}' is not a directory.")
        elif os.listdir(output_dir):
            # Add test to confirm if any files exist in directory
            errors.append(f"Output directory '{output_dir}' is not empty.")
    else:
        try:
            os.makedirs(output_dir)
        except Exception as e:
            errors.append(f"Failed to create output directory '{output_dir}': {e}")

    return errors

def copy_files(input_dir, output_dir):
    """Copy files from input directory to output directory, preserving structure.

    Args:
        input_dir (str): Path to the input directory.
        output_dir (str): Path to the output directory.
    """
    for root, _, files in os.walk(input_dir):
        # Compute the relative path from the input directory
        relative_path = os.path.relpath(root, input_dir)
        # Construct the corresponding output directory path
        target_dir = os.path.join(output_dir, relative_path)
        if not os.path.exists(target_dir):
            os.makedirs(target_dir)
        
        for file in files:
            source_file = os.path.join(root, file)
            target_file = os.path.join(target_dir, file)
            if file.endswith(('.md', '.sql')):
                # Copy file contents line by line
                with open(source_file, 'r', encoding='utf-8') as src, open(target_file, 'w', encoding='utf-8') as dst:
                    for line in src:
                        dst.write(line)
            else:
                # Copy binary files
                shutil.copy2(source_file, target_file)

def main():
    """Main function to handle command-line arguments and processing."""
    parser = argparse.ArgumentParser(
        description="Replicate directory structure and copy files from input to output directory."
    )
    parser.add_argument('input_dir', help="Path to the input directory.")
    parser.add_argument('output_dir', help="Path to the output directory.")
    args = parser.parse_args()
    
    input_dir = args.input_dir
    output_dir = args.output_dir
    
    # Validate directories
    errors = validate_directories(input_dir, output_dir)
    if errors:
        for error in errors:
            print(f"Error: {error}")
        return
    
    # Copy files
    copy_files(input_dir, output_dir)
    print("Directory replication and file copy complete.")

if __name__ == "__main__":
    main()
