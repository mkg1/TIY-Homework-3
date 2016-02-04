def total(card1, card2)
  card1.to_i + card2.to_i
end

def aces_to_eleven(card)
  if card == "A" || card == "a"
    return true
  end
end

def face_cards(card)
  if card == "J" || card == "j" || card == "Q" || card == "q" || card == "K" || card == "k"
    return true
  end
end

sub_hash_h = Hash.new("Hit")
simplified_h = Hash.new("Hit")
(2..6).each do |x|
  simplified_h[x] = "Stand"
end
simplified_h_2 = Hash.new("Hit")
(4..6).each do |x|
  simplified_h_2[x] = "Double if possible, otherwise hit"
end
sub_hash_dh = Hash.new("Double if possible, otherwise hit")
sub_hash_s = Hash.new("Stand")
sub_hash_p = Hash.new("Split")

hard_hash = { 5 => sub_hash_h,
              6 => sub_hash_h,
              7 => sub_hash_h,
              8 => sub_hash_h.merge!({5 => "Double if possible, otherwise hit", 6 => "Double if possible, otherwise hit"}),
              9 => sub_hash_h.merge({2 => "Double if possible, otherwise hit", 3 => "Double if possible, otherwise hit", 4 => "Double if possible, otherwise hit", 5 => "Double if possible, otherwise hit", 6 => "Double if possible, otherwise hit"}),
              10 => sub_hash_dh.merge({10 => "Hit", 11 => "Hit"}),
              11 => sub_hash_dh,
              12 => sub_hash_h.merge({4 => "Stand", 5 => "Stand", 6 => "Stand"}),
              13 => simplified_h,
              14 => simplified_h,
              15 => simplified_h,
              16 => simplified_h,
              17 => sub_hash_s,
              18 => sub_hash_s,
              19 => sub_hash_s,
              20 => sub_hash_s,
              21 => sub_hash_s
}

soft_hash = { 13 => simplified_h_2,
              14 => simplified_h_2,
              15 => simplified_h_2,
              16 => simplified_h_2,
              17 => sub_hash_h.merge({2 => "Double if possible, otherwise hit", 3 => "Double if possible, otherwise hit", 4 => "Double if possible, otherwise hit", 5 => "Double if possible, otherwise hit", 6 => "Double if possible, otherwise hit"}),
              18 => sub_hash_s.merge({3 => "Double if possible, otherwise stand", 4 => "Double if possible, otherwise stand", 5 => "Double if possible, otherwise stand", 6 => "Double if possible, otherwise stand", 9 => "Hit", 10 => "Hit"}),
              19 => sub_hash_s.merge({6 => "Double if possible, otherwise stand"}),
              20 => sub_hash_s,
              21 => sub_hash_s
}

pair_hash = {  4 => sub_hash_p.merge({8 => "Hit", 9 => "Hit", 10 => "Hit", 11 => "Hit"}),
               6 => sub_hash_p.merge({9 => "Hit", 10 => "Hit", 11 => "Hit"}),
               8 => sub_hash_h.merge({4 => "Split", 5 => "Split", 6 => "Split"}),
              10 => sub_hash_dh.merge({10 => "Hit", 11 => "Hit"}),
              12 => sub_hash_p.merge({8 => "Hit", 9 => "Hit", 10 => "Hit", 11 => "Hit"}),
              14 => sub_hash_p.merge({9 => "Hit", 10 => "Split", 11 => "Hit"}),
              16 => sub_hash_p,
              18 => sub_hash_p.merge({7 => "Split", 10 => "Split", 11 => "Split"}),
              20 => sub_hash_s,
              22 => sub_hash_p
}

puts "Lemme help you figure out the optimal move. What is your first card? If you have an ace, enter A. Otherwise, enter the number value of the card or J/Q/K or 10 for jacks, queens, or kings."
player_card_1 = gets.chomp
player_card_1 = 11 if aces_to_eleven(player_card_1)
player_card_1 = 10 if face_cards(player_card_1)

puts "OK, what is your second card?"
player_card_2 = gets.chomp
player_card_2 = 11 if aces_to_eleven(player_card_2)
player_card_2 = 10 if face_cards(player_card_2)

player_total = total(player_card_1, player_card_2)
puts "Great. The sum of your cards is #{player_total}."

puts "Now, what is the dealer's visible card?"
dealer_card = gets.chomp
dealer_card = 11 if aces_to_eleven(dealer_card)
dealer_card = 10 if face_cards(dealer_card)

if player_card_1 == player_card_2
  puts "Ok, you have a pair...let's see..."
  ideal_move = pair_hash[player_total][dealer_card.to_i]
elsif player_card_1 == 11 || player_card_2 == 11
  puts "Ok, you have one ace...let's see..."
  ideal_move = soft_hash[player_total][dealer_card.to_i]
else
  ideal_move = hard_hash[player_total][dealer_card.to_i]
end
puts "Your ideal move is: #{ideal_move}"
