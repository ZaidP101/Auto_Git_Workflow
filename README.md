# Auto_Git_Workflow
Git Automation Script

This Bash script automates the process of adding, committing, and pushing changes to a Git repository. It simplifies the workflow by allowing you to perform these Git operations through a series of prompts and automated steps.

Features
Git Add: Add specific files or all files to the staging area.
Git Commit: Commit changes with a user-provided message.
Git Push: Push committed changes to the remote repository.

Requirements
A Git-initialized folder.
An existing Git repository on GitHub

Improvement Needed
Currently, the git_push function always attempts to push changes to the remote repository. It would be more efficient to check if there are any commits to push before executing the git push command. Any suggestions or improvements for this function are welcome!
