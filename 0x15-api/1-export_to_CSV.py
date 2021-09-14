#!/usr/bin/python3
"""Module: 1-export_to_CSV"""
import csv
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
    FILE_NAME = USER_ID + '.csv'
    USER_NAME = user_req[0]['username']
    file_data = []

    for task in task_req:
        file_data.append([str(USER_ID), str(USER_NAME),
                        task['completed'], task['title']])

    with open(FILE_NAME, mode='w', encoding='UTF-8') as file:
        my_writer = csv.writer(file, quotechar='"', quoting=csv.QUOTE_ALL)
        my_writer.writerows(file_data)
