#!/bin/bash
# make a to do list

menu(){
	echo "============================"
	echo "1. Create a new job to do."
	echo "2. View all job are have."
	echo "3. Delete one job of list."
	echo "0. Exit program."
}
TODO_FILE="toDoList.txt"
touch "$TODO_FILE"
while true
do
	menu
	read -p "Chose an option (0-3):" action
	case "$action" in
		1)
			echo "Enter your job you want to create."
			read -p "Enter your job: " job
			if [ -n "$job" ]; then
				echo "$job" >> "$TODO_FILE"
				echo "Task add successfully"
			else
				echo "Task cannot be empty"
			fi
			;;
		2)
			if [ -s "$TODO_FILE" ]; then
				echo -e "\nCurrent Tasks:"
				nl "$TODO_FILE"
			else
				echo "No tasks found"
			fi
			;;
		3)
			if [ -s "$TODO_FILE" ]; then
				echo -e "\nCurrent Tasks:"
				nl "$TODO_FILE"
				read -p "Enter the number of your task to delete " numb
				if [[ "$numb" =~ ^[0-9]+$ ]]; then
					if [ "$numb" -le "$(wc -l < "$TODO_FILE")" ] && [ "$numb" -gt 0 ]; then
						sed -i "${numb}d" "$TODO_FILE"
						echo "Task delete successfully"
					else
						echo "Invalid task number"
					fi
				else
					echo "Please enter a valid number!"
				fi
			else
				echo "No tasks to delete."
			fi
			;;
		0)
			echo "End of program, bye bye!"
			exit 0
			;;
		*)
			echo "Invalid input, please try again."
			;;

	esac
	echo -e "\nPLease enter to continue"
	read
	clear 
done
