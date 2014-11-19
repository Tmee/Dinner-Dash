class Seed
  def initialize
    generate_users_and_roles
    # generate_orders
    # generate_line_items
    generate_items
    # generate_fillings
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

    admin_user.roles     = [Role.create!(name: "admin")]
    webmaster_user.roles = [Role.create!(name: "webmaster")]

    puts "Users generated!"
  end

  def generate_items
    Item.create!(name: "Burrito", price: 500)
    Item.create!(name: "Torta",   price: 400)
    Item.create!(name: "Taco",    price: 100)
    Item.create!(name: "Tamale",  price: 200)
    Item.create!(name: "Salad",   price: 300)
    puts "Items generated!"
  end

  # def generate_fillings
  #   Filling.create!(
  #     title:       "steak",
  #     description: "It's meat.",
  #     price:        100,
  #     type:        "protein"
  #   )
  # end

  # def generate_orders
  #   states = %W(ordered completed canceled)
  #   10.times do |i|
  #     user  = User.find(Random.new.rand(1..5))
  #     order = Order.create!(user_id: user.id, state: "#{states.sample}")
  #     add_items(order)
  #   end
  #   puts "Order's created!"
  # end

  # private

  # def add_items(order)
  #   10.times do |i|
  #     filling = Filling.find(Random.new.rand(1..20))
  #     order.fillings << filling
  #     puts "#{i}: Added filling #{filling.title} to order #{order.id}."
  #   end
  # end
end

Seed.new
