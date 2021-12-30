#!/bin/bash
# Clearing terminal
clear

# Reading arguments from prompt to commit
read -p $'\e[33mFile or task modified: \e[0m ' head
read -p $'\e[33mCommit body: \e[0m ' body

# Getting date
date=$(date +'%m/%d/%Y/%I:%M')

# Setting Capitalize head and body
head="$(tr '[:lower:]' '[:upper:]' <<< ${head:0:1})${head:1}"
body="$(tr '[:lower:]' '[:upper:]' <<< ${body:0:1})${body:1}"


# Making commit
commit="[ $head ] $body [ $date ]"
git commit -m "$commit"

# Cheking if commit could be done
if [ $? -eq 1 ]
then
    echo ""
    echo $'\e[31mSomething went wrong...\e[0m'
    echo ""
    exit
fi

# Printing commit preview
echo ""
echo $'\e[32mNew commit = \e[0m'$'\e[32m[ '$head' ]'$'\e[0m' $body $'\e[32m[ '$date' ]' $'\e[0m'
echo ""

# Giving the option to push
branch=$(git rev-parse --abbrev-ref HEAD)
read -p $'\e[33mDo you want to push to '$branch' y/n: ' choose

if [ $choose = "y" ] || [ $choose = "Y" ]
then
    echo "Pushing to $branch...."
    git push origin $(current_branch)
fi
