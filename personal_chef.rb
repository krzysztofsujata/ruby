class PersonalChef
	def get_order (butler,bread,params={})
		condiments = params[:condiments]
		meat = params[:meat] 
		veggies = params[:veggies]

		fridge = Fridge.new

		if fridge.check_for_ingredient(bread) == true
			condiments.each do |ingredient|
				if !fridge.check_for_ingredient(ingredient)
					puts "Chef: We don't have #{ingredient}. I'll make it without that"
				end
			end

			meat.each do |ingredient|
				if !fridge.check_for_ingredient(ingredient)
					puts "Chef: We don't have #{ingredient}. I'll make it without that"
				end
			end

			veggies.each do |ingredient|
				if !fridge.check_for_ingredient(ingredient)
					puts "Chef: We don't have #{ingredient}. I'll make it without that"
				end
			end
		else
			puts "Chef: Sorry, we don't have that kind of bread. You suck at ordering so I'm not making your sandwich. Go to Subway if you want one. I quit, this is total bullshit!\n\n"
			sleep 5
			return false
		end

		puts "Chef: Assembling your delicious (hopefully) sandwich. The butler will bring it to you when it's ready!"
		sleep 5
		sandwich = "                    _.---._
                _.-~       ~-._
            _.-~               ~-._
        _.-~                       ~---._
    _.-~                                 ~\
 .-~                                    _.;
 :-._                               _.-~ ./
 `-._~-._                   _..__.-~ _.-~
  /  ~-._~-._              / .__..--~----._
 \\_____(_;-._\\.        _.-~_/       ~).. . \\
    /(_____  \\`--...--~_.-~______..-+_______)
  .(_________/`--...--~/    _/           /\\
 /-._     \\_     (___./_..-~__.....__..-~./
 `-._~-._   ~\\--------~  .-~_..__.-~ _.-~
     ~-._~-._ ~---------'  / .__..--~
         ~-._\\.        _.-~_/
             \\`--...--~_.-~
              `--...--~"

		puts "Chef: ORDER UP!"
		sleep 5

		return sandwich
	end
end

class Butler
	def take_order
		puts "        .--.
       /    \
      ## a  a       _
      (   '._)     |_|
       |'-- |      | | 
     _.\\___/_   ___|_|___
   .\"\> \Y/|<'.  '._.-'
  /  \ \_\/ /  '-' /
  | --'\_/|/ |   _/
  |___.-' |  |`'`
    |     |  |
    |    / './
   /__./` | |
      \   | |
       \  | |
       ;  | |
       /  | |
   |___\\_.\\_
      `-\"--'---'  "

		puts "Butler: Hello sir, what kind of bread would you like on your sandwich? You can have it on rye, white, whole wheat, sourdough, or on a bagel or biscuit."
		bread = gets.chomp

		if (!["bagel","biscuit","rye","white","whole wheat","sourdough"].include?(bread.downcase))
			puts "Butler: Err... Not sure if we have that kind of bread, but I'll check\n\n"
		else
			bread = bread.downcase
		end

		puts "Butler: What kind of meat would you like. Just write it down for me, comma seperated if you want more than one..."
		meat = gets.chomp
		meat = meat.downcase
		meat = meat.split(",")

		puts "Butler: What kind of veggies would you like. Just write it down for me, comma seperated..."
		veggies = gets.chomp
		veggies = veggies.downcase
		veggies = veggies.split(",")

		puts "Butler: What kind of condiments would you like. Just write it down for me, comma seperated..."
		condiments = gets.chomp
		condiments = condiments.downcase
		condiments = condiments.split(",")

		puts "Butler: Thank you sir, I'll bring that out to you when it's ready\n\n"
		sleep 5
		frank = PersonalChef.new
		deliver(frank.get_order(self,bread,{:meat => meat,:veggies => veggies,:condiments => condiments}))
	end

	def deliver (sandwich)
		if sandwich == false
			puts "Butler: Sorry sir, the chef quit over you order, and now there is no sandwich. I hope you don't starve in your mansion...\n\n"
		else
			puts "Butler: Here is your sandwich, sir..."
			puts sandwich
			sleep 2
			puts "You: NOM NOM NOM NOM NOM NOM"
		end
	end


end

class Fridge

	def check_for_ingredient(ingredient)
		breads = ["bagel","biscuit","rye","white","whole wheat","sourdough"]
		condiments = ["mustard","honey mustard","relish","ketchup","mayonaise","mayo","dijon","dijon mustard"]
		veggies = ["lettuce","tomato","pickles","cucumber","olives","onions","spinach","peppers"]
		meat = ["ham","turkey","roast beef","chicken","spam","duck"]

		if (breads.include?(ingredient) || condiments.include?(ingredient) || veggies.include?(ingredient) || meat.include?(ingredient))
			return true
		else
			return false
		end
	end
end

charles = Butler.new
charles.take_order