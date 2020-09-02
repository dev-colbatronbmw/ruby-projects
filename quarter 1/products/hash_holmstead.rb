############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        Hash Assignment
#  Assignment Date:   01/21/2019
#  Class:             CIS 282
#  Description:       Create a menu driven program to interact with a set of products using a hash
#
############################################################
#
#
#
#
# 1.view all products – sorted by the ID of the product in ascending order
# 2.add a new product (generate a product id : 3 digit key)
# 	make sure key is unique, in other words don’t overwrite existing pair
#   separate prompts for both description and price
# 3.delete a product (give meaningful error message if product does not exist)
# 4.update a product (give meaningful error message if product does not exist)
# 	separate prompts for both description and price
# 5.view highest priced product (print out full info of item – not in hash format)
# 	provide meaningful statement “Highest priced item is: “
# 6.view lowest priced product (print out full info of item – not in hash format)
# 	provide meaningful statement “Lowest priced item is: “
# 7.view sum of all product prices (provide description of output user sees)
# 8.exit
# Create
# Read
# Update
# Delete
#this is to print a float as a 2 decimal string


=begin
  puts "format"
  puts format("%.2f",product[2])
=end

# hash [key] = value
# hash [random number] = ["product", price] #array in the hash HOMEWORK


product_file = File.open("products.txt", "r")

products = {}

until product_file.eof? do
  product = product_file.gets.chomp.split(",")


  product[0] = product[0].to_i


  product[2] = product[2].to_f


  product_id = product[0]

  products[product_id] = product

  products[product_id] = product[1], product[2]


  # p product
  # p products

end
# p products
product_file.close

# initalize menu

puts
puts "Welcome to the Product Database"
puts "please select a menu item"
puts
puts "1 (view all products)"
puts "2 (add a new product)"
puts "3 (delete a product)"
puts "4 (update a product)"
puts "5 (view highest priced product)"
puts "6 (view lowest priced product)"
puts "7 (view sum of all product prices)"
puts "8 (exit)"
puts
print "Please Make A Selection : "


user_menu_selection = gets.chomp.to_i

# puts user_menu_selection

#all inside an until exit loop

while user_menu_selection > 8 || user_menu_selection < 1

  puts
  puts "That was not a valid entry"
  puts
  puts "please select a menu item"
  puts
  puts "1 (view all products)"
  puts "2 (add a new product)"
  puts "3 (delete a product)"
  puts "4 (update a product)"
  puts "5 (view highest priced product)"
  puts "6 (view lowest priced product)"
  puts "7 (view sum of all product prices)"
  puts "8 (exit)"
  puts
  print "Please Make A Selection: "
  user_menu_selection = gets.chomp.to_i
end

while user_menu_selection <= 7 && user_menu_selection >= 1

  case user_menu_selection

  when 1 #1.view all products – sorted by the ID of the product in ascending order

    print "\nItem".rjust(3) + "Description".center(20) + "Price ".rjust(6) + "\n____".rjust(3) + "___________".center(20) + "______\n".rjust(6)
    products.keys.sort.each do |key|
      price = format("%.2f", products[key][1])
      print "\n#{key}".rjust(3) + "#{products[key][0]}".center(20) + price.rjust(6)
    end

  when 2 # 2.add a new product (generate a product id : 3 digit key)

    print "\nItem".rjust(3) + "Description".center(20) + "Price ".rjust(6) + "\n____".rjust(3) + "___________".center(20) + "______\n".rjust(6)
    products.keys.sort.each do |key|
      price = format("%.2f", products[key][1])
      print "\n#{key}".rjust(3) + "#{products[key][0]}".center(20) + price.rjust(6)
    end


    new_id_num = rand(100..999)
    # check before adding new product ID
    product_id_checker = []
    products.each do |product_id, product|
      product_id_checker << product_id
    end
    # new item must have unique product id
    product_id_checker.each do |index, value|
      if new_id_num == value
        new_id_num = rand(1..999)
      end
    end
    print "\n\nenter a new product: "
    new_description = gets.chomp

    while new_description == ""
      puts "Invalid Entry"
      puts "enter a new product description: "

      new_description = gets.chomp
    end

    puts "enter price: "
    new_price = gets.chomp.to_f

    while new_price == 0 || new_price > 999.99

      puts "Invalid Entry"
      puts "enter price: "
      new_price = gets.chomp.to_f
    end

    new_array = [new_description, new_price]

    products[new_id_num] = new_array

  when 3 # delete item from hash


    print "\nItem".rjust(3) + "Description".center(20) + "Price ".rjust(6) + "\n____".rjust(3) + "___________".center(20) + "______\n".rjust(6)
    products.keys.sort.each do |key|
      price = format("%.2f", products[key][1])
      print "\n#{key}".rjust(3) + "#{products[key][0]}".center(20) + price.rjust(6)
    end

    user_answer = "N"
    while user_answer != "Y"
      puts "\n\nPlease enter the Item number for the item you want to delete: "
      user_to_delete = gets.chomp.to_i
      item_to_delete = 0
      product_id_checker = []

      products.each do |product_id, product|
        product_id_checker << product_id
      end

      product_id_checker.each do |value|

        if value == user_to_delete
          item_to_delete = user_to_delete
          puts "you want to delete #{products[item_to_delete][0]} from the list?"
          puts "is this correct? (Y)(N): "
          user_answer = gets.chomp.capitalize
        end


      end

      if item_to_delete != user_to_delete
        puts "that item number does not match any in database try again"
      end

    end

    if item_to_delete == user_to_delete
      puts "you have deleted #{products[user_to_delete][0]} from the list"
      products.delete(item_to_delete)
    end


  when 4 # update the value in a element

    print "\nItem".rjust(3) + "Description".center(20) + "Price ".rjust(6) + "\n____".rjust(3) + "___________".center(20) + "______\n".rjust(6)
    products.keys.sort.each do |key|
      price = format("%.2f", products[key][1])
      print "\n#{key}".rjust(3) + "#{products[key][0]}".center(20) + price.rjust(6)
    end


    user_answer = "N"

    while user_answer != "Y"

      puts "\n\nPlease enter the ID for the item you want to update: "

      user_key_to_update = gets.chomp.to_i
      item_to_update = 0
      product_id_checker = []

      products.each do |product_id, product|
        product_id_checker << product_id

      end

      product_id_checker.each do |value|
        if value == user_key_to_update
          puts "you are updating #{products[user_key_to_update][0]} from the list"
          puts "is this correct? (Y)(N): "
          user_answer = gets.chomp.capitalize
          item_to_update = user_key_to_update
        end
      end

      if item_to_update != user_key_to_update
        puts "that item number does not match any in database try again"
      end

    end

    if item_to_update == user_key_to_update
      puts "please enter the new description"
      new_description = gets.chomp

      while new_description == ""
        puts "Invalid Entry"
        puts "enter a new product description: "

        new_description = gets.chomp
      end

      puts "enter price: "
      new_price = gets.chomp.to_f

      while new_price == 0 || new_price > 999.99

        puts "Invalid Entry"
        puts "enter price: "
        new_price = gets.chomp.to_f
      end
      products[user_key_to_update] = [new_description, new_price]

    end


  when 5 #view highest priced product
    current_highest_price = 0

    products.each do |key, value|
      if value[1] > current_highest_price
        current_highest_price = value[1]
      end

    end

    puts

    products.find do |key, value|

      if value.include?(current_highest_price) == true
        price = format("%.2f", products[key][1])
        puts "The highest priced item is\n"
        print "\nItem".rjust(3) + "Description".center(20) + "Price ".rjust(6) + "\n____".rjust(3) + "___________".center(20) + "______\n".rjust(6)
        print "\n#{key}".rjust(3) + "#{products[key][0]}".center(20) + price.rjust(6)


      end

    end


  when 6

    current_lowest_price = 999.99

    products.each do |key, value|

      if value[1] < current_lowest_price
        current_lowest_price = value[1]
      end

    end

    puts

    products.find do |key, value|

      if value.include?(current_lowest_price) == true
        price = format("%.2f", products[key][1])
        puts "The lowest priced item is:\n"
        print "\nItem".rjust(3) + "Description".center(20) + "Price ".rjust(6) + "\n____".rjust(3) + "___________".center(20) + "______\n".rjust(6)
        print "\n#{key}".rjust(3) + "#{products[key][0]}".center(20) + price.rjust(6)

      end

    end


  when 7

    sum_number = 0

    products.each do |key, value|
      sum_number = sum_number + value[1]
    end

    sum_number.to_s
    puts
    print "The total sum of all the prices is $#{format("%.2f", sum_number)}"
    puts
  end

  puts
  puts
  puts "What would you like to do next?"
  puts
  puts "1 (view all products)"
  puts "2 (add a new product)"
  puts "3 (delete a product)"
  puts "4 (update a product)"
  puts "5 (view highest priced product)"
  puts "6 (view lowest priced product)"
  puts "7 (view sum of all product prices)"
  puts "8 (exit)"
  puts
  print "Please Make A Selection: "


  user_menu_selection = gets.chomp.to_i


  while user_menu_selection > 8 || user_menu_selection < 1

    puts
    puts "That was not a valid entry"
    puts "please select a menu item"
    puts
    puts "1 (view all products)"
    puts "2 (add a new product)"
    puts "3 (delete a product)"
    puts "4 (update a product)"
    puts "5 (view highest priced product)"
    puts "6 (view lowest priced product)"
    puts "7 (view sum of all product prices)"
    puts "8 (exit)"
    puts
    print "Please Make A Selection: "

    user_menu_selection = gets.chomp.to_i

  end

# write to file


end


if user_menu_selection == 8

  puts "Goodbye"

  product_file = File.open("products.txt", "w+")

  products.each do |key, value|
    product_file.puts "#{key},#{value[0]},#{value[1]}"
  end

  product_file.close
end



