class Seed
  def initialize
    generate_users_and_roles
    generate_items
    generate_fillings
    # generate_orders
    # generate_line_items
    # generate_line_item_fillings
  end

 def generate_users_and_roles
    User.create!(
      first_name: "Rachel",
      last_name:  "Warbelow",
      email:      "demo+rachel@jumpstartlab.com",
      username:   "temp",
      password:   "password"
    )

    User.create!(
      first_name: "Jeff",
      last_name:  "temp",
      email:      "demo+jeff@jumpstartlab.com",
      username:   "j3",
      password:   "password"
    )

    User.create!(
      first_name: "Jorge",
      last_name:  "Tellez",
      email:      "demo+jorge@jumpstartlab.com",
      username:   "novohispano",
      password:   "password"
    )

    admin_user = User.create!(
      first_name: "Josh",
      last_name:  "Cheek",
      email:      "demo+josh@jumpstartlab.com",
      username:   "josh",
      password:   "password"
    )

    webmaster_user = User.create!(
      first_name: "Bruce",
      last_name:  "Wayne",
      email:      "Bruce_Wayne@WayneEnterprises.com",
      username:   "webmaster",
      password:   "password"
    )

    admin = Role.create!(name: "admin")
    admin_user.roles     = [admin]
    webmaster_user.roles = [Role.create!(name: "webmaster"), admin]

    puts "Users generated!"
  end

  def generate_items
    Item.create!(name: "Burrito",      price: 500)
    Item.create!(name: "Burrito Bowl", price: 175)
    Item.create!(name: "Torta",        price: 400)
    Item.create!(name: "Taco",         price: 100)
    Item.create!(name: "Quesadilla",   price: 250)
    Item.create!(name: "Tamale",       price: 200)
    Item.create!(name: "Salad",        price: 300)
    puts "Items generated!"
  end

  def generate_fillings
    Filling.create!(
      title:       "Steak",
      description: "It's meat. From an animal.",
      price:       100,
      food_group:  "meat"
    )

    Filling.create!(
      title:       "Chicken",
      description: "Made from home made chickens.",
      price:       70,
      food_group:  "meat"
    )

    Filling.create!(
      title:       "Barbacoa",
      description: "We think it's from goats.",
      price:       200,
      food_group:  "meat"
    )

    Filling.create!(
      title:       "Carnitas",
      description: "Pork.",
      price:       150,
      food_group:  "meat"
    )

    Filling.create!(
      title:       "Sofritas",
      description: "It's toe and fu.",
      price:       150,
      food_group:  "veggie"
    )

    Filling.create!(
      title:       "Fajita Vegetables",
      description: "It has some different peppers.",
      price:       100,
      food_group:  "veggies"
    )

    Filling.create!(
      title:       "Black Beans",
      description: "They are black.",
      food_group:  "veggies"
    )

    Filling.create!(
      title:       "Pinto Beans",
      description: "They are very pinto.",
      food_group:  "veggies"
    )

    Filling.create!(
      title:       "White Rice",
      description: "It's white and has cilantro.",
      food_group:  "veggies"
    )

    Filling.create!(
      title:       "Brown Rice",
      description: "It's brown.",
      food_group:  "veggies"
    )

    Filling.create!(
      title:       "Fresh Tomato Salsa",
      description: "Diced tomatoes and other bits.",
      food_group:  "salsas"
    )

    Filling.create!(
      title:       "Roasted Chili-Corn Salsa",
      description: "Sweet white corn.",
      food_group:  "salsas"
    )

    Filling.create!(
      title:       "Tomatillo-Green Chili Salsa",
      description: "Fire-roasted tomatillos? Yes please.",
      food_group:  "salsas"
    )

    Filling.create!(
      title:       "Tomatillo-Red Chili Salsa",
      description: "It's like the other sauce but with tabasco. Hot hot hot.",
      food_group:  "salsas"
    )

    Filling.create!(
      title:       "Cheese",
      description: "Literally, the best ever.",
      food_group:  "extras"
    )

    Filling.create!(
      title:       "Guacamole",
      description: "It's no longer avocados. It's better now.",
      food_group:  "extras"
    )

    Filling.create!(
      title:       "Sour Cream",
      description: "It's sour and cream.",
      food_group:  "extras"
    )

    Filling.create!(
      title:       "Queso",
      description: "It's some melted cheese.",
      price:       "50",
      food_group:  "extras"
    )

    Filling.create!(
      title:       "Queso Diablo",
      description: "It's some, spicy, melted cheese.",
      price:       "75",
      food_group:  "extras"
    )

    Filling.create!(
      title:              "Lettuce",
      description:        "Just some romaine.",
      food_group:         "extras"
    )

    puts "Fillings generated!"
  end

  # This is needed later:

  # def generate_orders
  #   states = %W(ordered completed canceled)
  #   10.times do |i|
  #     user  = User.find(Random.new.rand(1..5))
  #     order = Order.create!(user_id: user.id, state: "#{states.sample}")
  #     add_items(order)
  #   end
  #   puts "Order's created!"
  # end
  #
  # private
  #
  # def add_items(order)
  #   10.times do |i|
  #     filling = Filling.find(Random.new.rand(1..20))
  #     order.fillings << filling
  #     puts "#{i}: Added filling #{filling.title} to order #{order.id}."
  #   end
  # end
end

Seed.new
