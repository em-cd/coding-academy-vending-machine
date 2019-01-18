@balance = 0
@products = { sticker: 30, compliment: 100 }

def accept_coins
  puts 'Insert coin'
  coin = STDIN.gets.chomp

  while !coin.empty?
    coin = coin.to_i

    if coin == 50 || coin == 20 || coin == 10
      @balance += coin
      puts "Your new balance is #{@balance}"
    else
      puts "I don't know that coin"
    end

    puts 'Insert coin, or press enter to finish inserting coins'
    coin = STDIN.gets.chomp
  end
end

def select_product
  puts "Please select a product from the list below:"
  @products.each do |name, value|
    puts "#{name} - #{value}"
  end

  product = STDIN.gets.chomp
  price = @products[product.to_sym]

  if price <= @balance
    @balance -= price
    puts "Thank you, here's your #{product}"
    give_change
    exit
  else
    puts "You do not have enough balance for that!"
    display_options
  end
end

def give_change
  if @balance > 0
    puts "Your change is #{@balance}"
    @balance = 0
  end
end

def display_options
  puts "Your balance is #{@balance}"
  puts "Press 1 to enter coins, or 2 to select a product"

  input = STDIN.gets.chomp
    case input
      when '1' then accept_coins
      when '2' then select_product
    end
end

def run
  loop do
    display_options
  end
end

run
