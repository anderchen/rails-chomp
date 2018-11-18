# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'


puts "Creating diets...."

diets = %w(Gluten Vegetarian Wheat Milk Peanut Soy)
diets.each do |category|
  Diet.create!(name: category)
end

puts "Diets created!!"



puts "Adding Ben and Jerry's to products...."

# Getting the href of each product
url_index = 'https://www.benandjerry.com.br/sabores/potes'
html_file_index = open(url_index).read
html_doc_index = Nokogiri::HTML(html_file_index)

flavor_href = []

html_doc_index.search(".landing-item").each do | element|
  flavor_href << element.attribute('href').value
end

#Seeding the database with each product info
flavor_href.each do |href|
  url_flavor = "https://www.benandjerry.com.br#{href}"
  html_file_flavor = open(url_flavor).read
  html_doc_flavor = Nokogiri::HTML(html_file_flavor)

  product = Product.new
  product.brand = "Ben and Jerry's"
  product.category = "Ice-cream"

  html_doc_flavor.search("h1[itemprop=name]").each do |element|
    product.name = element.text
  end

  html_doc_flavor.search("accordion-content-style").each do |element|
    puts element.attribute()
  end
end

puts "Ben and Jerry's successfully added!"
