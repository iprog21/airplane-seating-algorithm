# Airplanne Seating Algorithm Setup

Steps

1. sudo chown -R $USER:$USER . (For Linux user)
2. docker-compose build
3. docker-compose up
4. docker-compose run web rake db:create
5. http://localhost:3000

> Assignment (BE)

**Airplane Seating Algorithm**

Write a program that helps seat audiences in a flight based on the following input and rules.

**Rules for seating**

1. Always seat passengers starting from the front row to back, starting from the left to the right
2. Fill aisle seats first followed by window seats followed by center seats (any order in center seats)

**Input to the program will be**

1. A 2D array that represents the columns and rows - Ex. [[3,4], [4,5], [2,3], [3,4]]
2. Number of passengers waiting in the queue.

**Example**

Given - A 2D array that represents the columns and rows - [[3,2], [4,3], [2,3], [3,4]]
