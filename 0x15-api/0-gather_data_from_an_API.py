#!/usr/bin/python3
"""Module: 0-gather_data_from_an_API.py"""
import json
import requests
import sys

if __name__ == "__main__":

    if len(sys.argv) < 2:
        sys.exit()

    id = sys.argv[1]

    # fetch('https://jsonplaceholder.typicode.com/todos/1')
    user_url = 'https://jsonplaceholder.typicode.com/users?id=' + id
    task_url = 'https://jsonplaceholder.typicode.com/todos?userId=' + id

    user_req = requests.get(user_url).json()
    task_req = requests.get(task_url).json()

    EMPLOYEE_NAME = user_req[0]['name']
    TOTAL_NUMBER_OF_TASKS = len(task_req)
    NUMBER_OF_DONE_TASKS = 0

    for task in task_req:
        if task['completed'] is True:
            NUMBER_OF_DONE_TASKS += 1

    print('Employee {} is done with tasks({}/{}):'.
          format(EMPLOYEE_NAME, NUMBER_OF_DONE_TASKS, TOTAL_NUMBER_OF_TASKS))

    for task in task_req:
        if task['completed'] is True:
            print('\t {}'.format(task['title']))
