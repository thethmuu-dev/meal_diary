# Meal Diary

## Overview

People usually want to track their daily cosumed amount of nutrients. If they want to change their body weight or eating habits, it is a good things to have records of such things. And they should set a nutrient goal that is suitable for their body weight or health.

This application can do the job of recording those and setting a goal and comparing the ideal amount and real amount of consument of a person. By this way, people can have a better overview their meal habits and can have a better control over them.

Then, they can share their each meal with other people to let their friends know how they are trying to improve their health by taking care of eating habits.

### Concept

Record meals of a person and share with others

### Version

Ruby 2.6.6 Rails 6.0.3.4

### CSS Framework

Bulma CSS 0.9.0

## Catalog Design

https://docs.google.com/spreadsheets/d/1E1QcVsUx37SHG_OqxNnWS6tE8m5tFI168Ma6SG-k3N0/edit?usp=sharing

## Functions List

- [x] Admin Login function
  - [x] Redirect to Admin Dashboard
- [x] Admin can view Users, Their Details and Delete them
- [x] Admin can view Entries and Their Details
- [x] Admin can view Categories and Their Details
- [x] Admin can view Followers and Followings \

- [x] User registration function
  - [x] username, email, password required
- [x] User Login function \

- [x] Meal Records Today list view function
- [x] Meal Record Create Function
  - [x] calories, proteins, carbohydrates, fats, meal_type, category_id required
- [x] Meal Record Edit, Delete Functions
- [x] Meal Records Overall Archives view function \

- [x] Categories list view function
- [x] Category Create Function
  - [x] category name required
- [x] Category Edit, Delete Functions \

- [x] Set a Diet Goal Function
  - [x] calories, proteins, carbohydrates, fats required
- [x] View Diet Goal
- [x] View Diet Goal compared to today's total nutrients
- [x] Diet Goal Edit Function \

- [x] User follow other users
- [x] User unfollow other users
- [x] User can see entries from users who he/she follows \

## Table Definition

https://docs.google.com/spreadsheets/d/1ptK1vKi5qf0oK5B4Fd8iZgUJAXtJUQAZw6owjVWz498/edit?usp=sharing

## ER Diagram

https://drive.google.com/file/d/13CTMcZgH4HZ7flIsm3IVmgqXzWVeFL33/view?usp=sharing

## Screen Transition Diagram



## Screen Wireframe

https://docs.google.com/spreadsheets/d/1VebG7YPKTVHjBvSyb2uY_aVR6f3EJ84ekbGR71fkyb8/edit?usp=sharing

## Gem Predetermined to be Used

- letter_opener_web
- devise
- carrierwave
- mini_magick
- rspec
- pagy
- animate.css-rails
- rails_admin
- cancancan