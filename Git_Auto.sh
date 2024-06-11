#!/bin/bash

###################### Automating Git #########################

read -p "Your Name: " Name
echo "Hello $Name! Welcome to the Git_Auto script"

echo "Below are the list of commands we gonna automate:"
echo "1- Git add"
echo "2- Git commit"
echo "3- Git push"

echo "Requirements: You need to create a folder with Git initialized in it, and your Git repo already created on Github."

read -p "Input the path of your folder: " Path
cd "$Path"

if [ $? -eq 0 ]; then
    # '$?' stores the previous command's exit status. If the last command is equal to zero, then it was successful.
    echo "Listing all content"
    ls -al
else
    echo "Failed to navigate to the directory. Please check the path"
    exit 1
fi

git_add() {
    read -p "Number of files to be added: " times
    for ((x=1; x<=times; x++)); do 
        read -p "Input name of the file to be added: " File_Name
        git add "$File_Name"
        echo "Added $File_Name successfully"
    done
}

git_add_all() {
    git add .
    echo "All content added successfully"
}

git_commit() {
    read -p "Give a message for the commit: " message
    git diff --cached --quiet
    if [ $? -eq 0 ]; then
        echo "No changes to commit"
    else
        git commit -m "$message"
        echo "Changes committed successfully"
    fi
}

git_push() {
	#git diff --cached --quiet
	#if [ $? -eq 0 ]; then
	#	echo "Nothing to push"
	#else
		git push -u origin main
	#	echo "Pushed to the remote repository. Enter your username and authentication key if prompted"
	#fi

}

read -p "If you wish to add all the listed files press 'a' or press 'b' to add particular file/files: " choice
if [ "$choice" == "a" ]; then
    git_add_all
elif [ "$choice" == "b" ]; then
    git_add
else 
    echo "Invalid input. Please enter 'a' or 'b'."
    exit 1
fi

git_commit

git_push
