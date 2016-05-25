# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p = Product.new(name:'Nutella', quantity: '750 g', brands: 'Nutella,Ferrero', categories: 'Petit-déjeuners,Produits à tartiner,Produits à tartiner sucrés,Pâtes à tartiner,Pâtes à tartiner au chocolat,Pâtes à tartiner aux noisettes,Pâtes à tartiner aux noisettes et au cacao', ingredients: 'SUGAR, PALM OIL, _HAZELNUTS_, COCOA, SKIM MILK, REDUCED MINERALS WHEY (MILK), LECITHIN AS EMULSIFIER (SOY), VANILLIN: AN ARTIFICIAL FLAVOR', upc_code: '0009800895250')
p.image = 'http://static.openfoodfacts.org/images/products/000/980/089/5250/front_en.21.200.jpg'
p.save

p = Product.new(name:'Skinless & Boneless Sardines in Olive Oil', quantity:'3.75 oz (106 g)', brands:'Crown Prince', categories:' ', ingredients:'_Sardines_, olive oil, salt.', upc_code: '0073230000331')
p.image = 'http://static.openfoodfacts.org/images/products/007/323/000/0331/front_en.6.200.jpg'
p.save

p = Product.new(name: 'South of the Border Tortilla Soup Mix', quantity: '4.5 oz', brands:'Frontier Soups', categories: ' ', ingredients: ' ', upc_code: '0766694301204')
p.image = 'http://static.openfoodfacts.org/images/products/076/669/430/1204/front_en.3.200.jpg'
p.save

p = Product.new(name: 'Marinara', quantity: 'Net WT 24 oz (1lb 8oz) 680g', brands: "Newman's Own", categories: 'Groceries,Sauces,Pasta sauces', ingredients: 'TOMATO PUREE (WATER, TOMATO PASTE, CITRIC ACID), DICED TOMATOES, SALT, CANE SUGAR, EXTRA VIRGIN OLIVE OIL, SPICES, ONION, GARLIC.', upc_code: '0020662000200')
p.image = 'http://static.openfoodfacts.org/images/products/002/066/200/0200/front_en.6.200.jpg'
p.save
