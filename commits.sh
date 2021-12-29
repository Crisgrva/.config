#!/bin/bash
# Reading arguments from prompt to commit
read -p $'\e[33mFile or task modified: \e[0m ' head
read -p $'\e[33mCommit body: \e[0m ' body

# Getting date
date=$(date +'%m/%d/%Y/%I:%M')

# Setting Capitalize head and body
head="$(tr '[:lower:]' '[:upper:]' <<< ${head:0:1})${head:1}"
body="$(tr '[:lower:]' '[:upper:]' <<< ${body:0:1})${body:1}"
echo ""

# Printing commit preview
echo $'\e[32mNew commit = \e[0m'$'\e[32m[ '$head' ]'$'\e[0m' $body $'\e[32m[ '$date' ]' $'\e[0m'

# Making commit
commit="'[ $head ] $body [ $date ]'"
git commit -m "$commit"
echo ""