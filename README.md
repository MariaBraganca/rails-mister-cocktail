# Mister Cocktail 

Mister Cocktail is a Ruby on Rails Application for all cocktail lovers around the world!

This project was initially built within the scope of the Bootcamp at Le Wagon with Ruby, HTML, CSS and JavaScript. Later on, I've spent time optimizing the database seeding, search and filters as well as creating an overall enjoyable user experience.

## Web Stack
* Github
* Ruby on Rails
* Sqlite
* Heroku

## Libraries
* PG Search
* Bootstrap
* Cloudinary
* bubbly-bg

## Goal and Process
The purpose of this project is to allow users to search, filter and create their own cocktails.

For the database seeding, I parsed data from the test API key available at [Cocktail DB](https://www.thecocktaildb.com/api.php). Furthermore, I used *PG Search* to allow the user to search for a specific cocktail or ingredient.

On the cocktail's model I've created 3 collections for category, alcoholic and glass. The filters, located on the navigation bar, were easily set up using dropdown menus and simple form.

CRUD methods were implemented on the cocktail's and dose's controllers for user interaction. Regarding the hosting and uploading of images, I've worked with *Cloudinary*.

For more information visity my [Profile Page](https://mariabraganca.github.io/profile/pr_mrcocktail.html)

## Live Preview
👉 [MB Mister Cocktail](https://secret-plains-56444.herokuapp.com/)


## Screenshot
![Gif Cocktail](https://res.cloudinary.com/db5jh0zwo/image/upload/v1601828728/profile/cocktail-homepage.jpg)

