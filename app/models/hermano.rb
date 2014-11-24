class Hermano
  def self.say_that_cool_thing(say_this=nil)
    cool_sayings = [
      "Buy more burritos!",
      "Give the bowls a try!",
      "Welcome to my home, strange visitor!",
      "This site needs more goat meat...",
      "No beer? Bah!!",
      "La ensalada viene con trozos de la felicidad ;)"
      ]
      say_this.nil? || say_this.empty? ? cool_sayings.sample : say_this
  end
end
