require 'open-uri'
require 'nokogiri'


# puts "Creating diets...."

# diets = %w(Gluten Vegetarian Wheat Milk Peanut Soy)
# diets.each do |category|
#   Diet.create!(name: category)
# end

# puts "Diets created!!"



# puts "Adding Ben and Jerry's to products...."

# # Getting the href of each product
# url_index = 'https://www.benandjerry.com.br/sabores/potes'
# html_file_index = open(url_index).read
# html_doc_index = Nokogiri::HTML(html_file_index)

# flavor_href = []

# html_doc_index.search(".landing-item").each do | element|
#   flavor_href << element.attribute('href').value
# end


# # Seeding the database with each product info
# flavor_href.each do |href|
#   url_flavor = "https://www.benandjerry.com.br#{href}"
#   html_file_flavor = open(url_flavor).read
#   html_doc_flavor = Nokogiri::HTML(html_file_flavor)

#   puts "Going in #{href}..."

#   html_doc_flavor.search(".content").each do |element|
#     product = Product.new
#     product.brand = "Ben and Jerry's"
#     product.category = "Ice-cream"
#     product.user_id = 1
#     product.name = element.css("h1[itemprop=name]").text.strip
#     product.ingredients = element.css(".package-ingredients").text
#     product.traces = element.css(".package-allergy_info").text
#     product.save!
#   end
# end

# puts "Ben and Jerry's successfully added!"

puts "Adding Taeq to products...."

# Getting the href of each product
counter = 1
product_href = []

while counter < 19

  url_index = "https://www.conquistesuavida.com.br/produtos/#{counter}?"
  html_file_index = open(url_index).read
  html_doc_index = Nokogiri::HTML(html_file_index)

  html_doc_index.search(".product").each do | element|
    product_href << element.attribute('href').value
  end

  counter += 1
end

# Seeding the database with each product info
product_href.each do |href|
  url_product = "https://www.conquistesuavida.com.br/produtos/cookie-integral-de-aveia-e-mel-taeq-40g_p482/1"
  html_file_product = open(url_product).read
  html_doc_product = Nokogiri::HTML(html_file_product)

  puts "Going in #{href}..."

  html_doc_flavor.search(".product-details").each do |element|
    product = Product.new
    product.brand = "Taeq"
    product.user_id = 1
    product.name = element.css("div.product-details-title").text.strip
    product.ingredients = element.css("div.product-details-ingredients").text
    product.traces = element.
    # product.traces = element.css("div.product-details-ingredients").text
    product.save!
  end
end

puts "Taeq successfully added!"






