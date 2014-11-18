class Seed
  def initialize
    generate_users
    # generate_items
    # generate_orders
  end

  def generate_users
    User.create!(
      first_name: "Rachel",
      last_name:  "Warbelow",
      email:      "demo+rachel@jumpstartlab.com",
      password:   "password"
    )

    User.create!(
      first_name: "Jeff",
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

    User.create!(
      first_name: "Josh",
      last_name:  "Cheek",
      email:      "demo+josh@jumpstartlab.com",
      username:   "josh",
      password:   "password"
    )
    puts "User #{i}: #{user.name} - #{user.email} created!"
  end

  # def generate_items
  #   500.times do |i|
  #     filling = Filling.create!(
  #       name: Faker::Commerce.product_name,
  #       description: Faker::Lorem.paragraph,
  #       image_url: "http://robohash.org/#{i}.png?set=set1&size=200x200"
  #       )
  #     puts "Filling #{i}: #{item.name} created!"
  #   end
  # end

  # def generate_orders
  #   100.times do |i|
  #     user  = User.find(Random.new.rand(1..50))
  #     order = Order.create!(user_id: user.id)
  #     add_items(order)
  #     puts "Order #{i}: Order for #{user.name} created!"
  #   end
  # end

  # private

  # def add_items(order)
  #   10.times do |i|
  #     filling = Filling.find(Random.new.rand(1..500))
  #     order.items << item
  #     puts "#{i}: Added item #{item.name} to order #{order.id}."
  #   end
  # end
end

Seed.new
