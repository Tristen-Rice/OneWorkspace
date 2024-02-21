#!/bin/bash

# Create a skeleton directory structure for a new project
# The structure will be as follows:
# OneWorkSpace/
#   README.md
#   LICENSE
#   .Ds_Store
#   src/
#      Models/
#      Views/
#         Components/
#      ViewModels/

#Define the function
#Do you want to execute the script?

    read -p "Do you want to execute the script? " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Exiting..."
        exit 1
    fi

# Define the base directory
BASE_DIR="OneWorkSpace"

# Create the directory structure
mkdir -p "$BASE_DIR/src/Models"
mkdir -p "$BASE_DIR/src/Views/Components"
mkdir -p "$BASE_DIR/src/ViewModels"

# Create placeholder files
touch "$BASE_DIR/README.md"
touch "$BASE_DIR/LICENSE"
echo ".DS_Store" > "$BASE_DIR/.gitignore"
touch "$BASE_DIR/src/Models/Workspace.swift"
touch "$BASE_DIR/src/Views/MainView.swift"
touch "$BASE_DIR/src/Views/WorkspaceDetailView.swift"
touch "$BASE_DIR/src/Views/Components/WorkspaceRow.swift"
touch "$BASE_DIR/src/ViewModels/WorkspaceViewModel.swift"

# Output the structure (optional)
echo "OneWorkSpace project structure created:"
find "$BASE_DIR" -type d -print | sed 's/^/  /'
