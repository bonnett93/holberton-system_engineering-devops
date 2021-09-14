#!/usr/bin/python3
"""Module: 1-export_to_CSV"""
import json
import requests
import sys

if __name__ == "__main__":

    if len(sys.argv) < 2:
        sys.exit()

    USER_ID = sys.argv[1]

    # fetch('https://jsonplaceholder.typicode.com/todos/1')
    user_url = 'https://jsonplaceholder.typicode.com/users?id=' + USER_ID
    task_url = 'https://jsonplaceholder.typicode.com/todos?userId=' + USER_ID

    user_req = requests.get(user_url).json()
    task_req = requests.get(task_url).json()

    EMPLOYEE_NAME = user_req[0]['name']
    USER_NAME = user_req[0]['username']

    FILE_NAME = USER_ID + '.json'
    file_data = {str(USER_ID): []}

    for task in task_req:
        TASK_TITLE = task['title']
        TASK_COMPLETED_STATUS = task['completed']
        new_dict = {"task": TASK_TITLE,
                    "completed": TASK_COMPLETED_STATUS,
                    "username": USER_NAME}
        file_data[str(USER_ID)].append(new_dict)

    with open(FILE_NAME, mode='w', encoding='UTF-8') as file:
        json.dump(file_data, file)
