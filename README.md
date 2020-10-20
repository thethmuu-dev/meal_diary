# Meal Diary

## Overview

A person can add his/her meal log, set diet goals and share with other users

### Concept

Record Meals of a person and share with others

### Version

Ruby 2.6.6 Rails 6.0.3.4

## Catalog Design

https://docs.google.com/spreadsheets/d/1E1QcVsUx37SHG_OqxNnWS6tE8m5tFI168Ma6SG-k3N0/edit?usp=sharing

## Functions List

- [x] Login function
- [x] User registration function
  - [x] username, email, password required

- [x] Meal Records list view function
- [x] Meal Record Create Function
  - [x] calories, proteins, carbohydrates, fats, meal_type, category_id required
- [x] Meal Record Edit, Delete Functions

- [x] Categories list view function
- [x] Category Create Function
  - [x] category name required
- [x] Category Edit, Delete Functions

- [x] Set a Diet Goal Function
  - [x] calories, proteins, carbohydrates, fats required
- [x] View Diet Goal
- [x] View Diet Goal compared to today's total nutrients
- [x] Diet Goal Edit, Delete Functions

- User follow other users
- User unfollow other users
- User can see entries from users who he/she follows

- User favourite other users' posts
- User can view his/her favourited posts

## Table Definition

https://docs.google.com/spreadsheets/d/1ptK1vKi5qf0oK5B4Fd8iZgUJAXtJUQAZw6owjVWz498/edit?usp=sharing

## ER Diagram

https://drive.google.com/file/d/13CTMcZgH4HZ7flIsm3IVmgqXzWVeFL33/view?usp=sharing

## Screen Transition Diagram



## Screen Wireframe



## Gem Predetermined to be Used

- letter_opener_web
- devise
- carrierwave
- mini_magick
- rspec