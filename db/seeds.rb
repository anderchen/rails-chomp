require 'open-uri'
require 'nokogiri'

# UNCOMMENT EACH ONE OF THE SEEDS TO WORK!!

puts "Creating diets...."

diets = [['Leite', "iconsvg icon-leite"],
         ['Ovos', "iconsvg icon-ovos"],
         ['Peixe', "iconsvg icon-peixe"],
         ['Crustáceo', "iconsvg icon-crustaceo"],
         ['Nozes', "iconsvg icon-nozes"],
         ['Amendoim', "iconsvg icon-amendoim"],
         ['Trigo', "iconsvg icon-trigo"],
         ['Soja', "iconsvg icon-soja"],
         ['Carne', "iconsvg icon-carne"],
         ['Gluten', "iconsvg icon-gluten"],
         ['Traços de Leite', "iconsvg icon-leite"],
         ['Traços de Ovos', "iconsvg icon-ovos"],
         ['Traços de Peixe', "iconsvg icon-peixe"],
         ['Traços de Crustáceo', "iconsvg icon-crustaceo"],
         ['Traços de Nozes', "iconsvg icon-nozes"],
         ['Traços de Amendoim', "iconsvg icon-amendoim"],
         ['Traços de Trigo', "iconsvg icon-trigo"],
         ['Traços de Soja', "iconsvg icon-soja"],
         ['Traços de Carne', "iconsvg icon-carne"],
         ['Traços de Gluten', "iconsvg icon-gluten"]]
diets.each do |category|
  diet = Diet.new
  diet.name = category[0]
  diet.icon = category[1]
  diet.save!
end

puts "Diets created!!"

## -----------------------------------------------------------

# # Getting Ben and Jerry's products
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
#     product.ingredients = element.css(".package-ingredients").text.strip
#     product.traces = element.css(".package-allergy_info").text.strip
#     product.save!
#   end
# end

# puts "Ben and Jerry's successfully added!"

# # #--------------------------------------------------------------------------------

# Getting Taeq's products
puts "Adding Taeq to products...."
# Getting the href of each product
counter = 1
product_href = []

while counter < 14
  if counter != 9
    url_index = "https://www.conquistesuavida.com.br/produtos/#{counter}?"
    html_file_index = open(url_index).read
    html_doc_index = Nokogiri::HTML(html_file_index)

    html_doc_index.search(".product").each do | element|
      product_href << element.attribute('href').value
    end
  end
  counter += 1
end

# Seeding the database with each product info
product_href.each do |href|
  url_product = "https://www.conquistesuavida.com.br/produtos/#{href}"
  html_file_product = open(url_product).read
  html_doc_product = Nokogiri::HTML(html_file_product)

  puts "Going in #{href}..."

  html_doc_product.search(".product-details").each do |element|
    product = Product.new
    product.brand = "Taeq"
    product.user_id = 1
    product.name = element.css(".product-details-title").text.strip
    product.ingredients = element.css(".product-details-ingredients").text.strip

    url_photo = element.css(".product-details-image img").attr("src")
    product.remote_photo_url = url_photo

    # Using regex to filter the allergens and put it in the traces column
    traces = element.css(".product-details-ingredients").text.strip
    # Checks if it contains gluten or not in the ingredients
    if traces =~ /não contém.\D*/i
      product.traces = traces[/não contém.\D*/i]
    else
      product.traces = traces[/contém.\D*/i]
    end

    product.save!
  end
end

puts "Taeq successfully added!"

# ------------------------------------------------------------------------------

# Scraping products from Mr Veggy
puts "Getting Mr Veggy's products..."

# Getting Mr Veggy's category href
category_href = []

url_index = "http://mrveggy.com/produtos-mr-veggy/"
html_file_index = open(url_index).read
html_doc_index = Nokogiri::HTML(html_file_index)

html_doc_index.search(".img-produto a").each do | element|
  category_href << element.attribute('href').value
end

# Getting Mr Veggy's product href
product_href = []
category_href.each do |category|

  url_index = category
  html_file_index = open(url_index).read
  html_doc_index = Nokogiri::HTML(html_file_index)

  html_doc_index.search(".data a").each do | element|
    product_href << element.attribute('href').value
  end
end
new_product_href, odd = product_href.partition.with_index { |_,i| i.even? }

# Getting information of each Mr Veggy's product
new_product_href.each do |href|
  next if href == "http://mrveggy.com/produtos/quibe-vegetariano/"
  puts "Going in #{href}..."


  url_index = href
  html_file_index = open(url_index).read
  html_doc_index = Nokogiri::HTML(html_file_index)

  html_doc_index.search(".produto-classicos").each do | element|
    product = Product.new
    product.brand = "Mr. Veggy"
    product.user_id = 1
    product.name = element.css(".data h1").text.strip
    product.ingredients = element.css(".full-content p").first.text.strip
    product.traces = element.css("strong").first.text.strip
    product.save!
  end
end

puts "Mr Veggy's products successfully added"

#------------------------------------------------------------------------------
puts "Getting Toddyinho's products..."
category_href = []

url_index = "https://www.toddynho.com.br/produtos.php"
html_file_index = open(url_index).read
html_doc_index = Nokogiri::HTML(html_file_index)

html_doc_index.search(".box-botao a").each do | element|
  category_href << element.attribute('href').value
end

category_href.each do |href|
  next if href == "tabelas-chocolate.php"
  puts "Going in #{href}..."

  url_index = "https://www.toddynho.com.br/#{href}"
  html_file_index = open(url_index).read
  html_doc_index = Nokogiri::HTML(html_file_index)

  html_doc_index.search(".box-conteudo-tabela").each do | element|
    product = Product.new
    product.brand = "Pepsico"
    product.user_id = 1
    product.name = "Toddyinho"
    product.ingredients = element.css(".ingredientes").text.strip
    product.traces = element.css(".ingredientes b").last.text.strip
    product.save!
  end
end

puts "Toddyinho's product successfully added"

#------------------------------------------------------------------------------
