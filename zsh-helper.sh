#!/bin/bash

# Get the directory where the script resides, which is assumed to be the OneWorkSpace directory
ONEWORKSPACE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Escape the path for sed usage
ESCAPED_DIR=$(printf '%s\n' "$ONEWORKSPACE_DIR" | sed -e 's/[\/&]/\\&/g')

# Define the chpwd function and additional aliases to add to .zshrc
read -r -d '' CUSTOM_COMMANDS << EOM
# Function to customize the shell environment for OneWorkSpace
chpwd_one_workspace() {
  # Define the path to your OneWorkSpace directory
  local workspace_dir="${ESCAPED_DIR}"

  # Check if the current directory is the OneWorkSpace directory or a subdirectory of it
  if [[ \$PWD == \$workspace_dir* ]]; then
    # Customizations for OneWorkSpace
    export WORKSPACE_ENV="development"open
    alias runworkspace="cd \$workspace_dir && ./run_workspace.sh"
    echo "Entered OneWorkSpace directory. Custom environment loaded."

    # Development aliases
    alias commit="git commit -m"
    alias push="git push"
    alias pull="git pull"
    alias status="git status"
    alias vsopen="code \$workspace_dir"
    alias xcopen="open \$workspace_dir/*.xcodeproj"

    echo "Development aliases activated."
  else
    # Reset customizations when leaving the OneWorkSpace directory
    unset WORKSPACE_ENV
    unalias runworkspace 2> /dev/null
    unalias commit 2> /dev/null
    unalias push 2> /dev/null
    unalias pull 2> /dev/null
    unalias status 2> /dev/null
    unalias vsopen 2> /dev/null
    unalias xcopen 2> /dev/null
  fi
}

# Register the chpwd function as a hook
autoload -U add-zsh-hook
add-zsh-hook chpwd chpwd_one_workspace

# Call chpwd_one_workspace in case the terminal is opened directly in the workspace directory
chpwd_one_workspace
EOM

# Append the chpwd function and aliases to the end of .zshrc
echo "$CUSTOM_COMMANDS" >> ~/.zshrc

echo "OneWorkSpace environment setup with custom commands added to .zshrc."
