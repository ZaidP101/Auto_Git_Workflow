#!/bin/bash

###################### Automating Git #########################

read -p "Your Name : " Name
echo "Hello $Name! Welcome to the Git_Auto script"

echo "Below are the list of commands we gonna Automate:"
echo "1- Git add"
echo "2- Git commit"
echo "3- Git push"

echo "Requirements: You need to create a folder with Git initialized in it, and your Git repo already created on Github."

read -p "Input the path of your Folder : " Path
cd "$Path"

if [ $? -eq 0 ]; then
    # '$?' this stores the previous command. If the last command is equal to zero then it was successful.
    echo "Listing all content"
    ls -al
else
    echo "Failed to navigate to the directory. Please check the path"
    exit 1
fi

git_add() {
    read -p "Number of files to be added : " times
    for ((x=1; x<=times; x++)); do 
        read -p "Input name of the File to be added : " File_Name
        git add "$File_Name"
        echo "Added $File_Name Successfully"
    done
}

git_add_all() {
    git add .
    echo "All content added successfully"
}

read -p "If you wish to add all the listed files press 'a' or Press 'b' to add particular file/files: " choice
if [ "$choice" == "a" ]; then
    git_add_all
elif [ "$choice" == "b" ]; then
    git_add
else 
    echo "Invalid input. Please enter 'a' or 'b'."
fi
