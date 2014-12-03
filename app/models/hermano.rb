class Hermano
  def self.say_cool_thing(say_this=nil)
    cool_sayings = [
      "Buy more burritos!",
      "Give the bowls a try!",
      "Welcome to my home, strange visitor!",
      "This site needs more goat meat...",
      "No beer? Bah!!",
      "Don't look, I'm changin'!"
      ]
      say_this.nil? || say_this.empty? ? cool_sayings.sample : say_this
  end
end
