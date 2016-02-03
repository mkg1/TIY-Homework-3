def total (card1, card2)
  return card1.to_i + card2.to_i
end

# def hand_type(card1, card2)
#   if card1 == card2
#     return
#   elsif card1 == 11 || card2 == 11
#     which_hash = soft
# end

#method for hard/soft/pair

# hard_hash = {}# soft_hash = {}# pair_hash = {}
sub_hash_h = Hash.new("Hit")
sub_hash_dh = Hash.new("Double if possible, otherwise hit")
sub_hash_s = Hash.new("Stand")
sub_hash_p = Hash.new("Split")
#do an each thing# (2..6).each do |n| #   hash[n] = "stand" # end
hard_hash = { 5 => sub_hash_h,
              6 => sub_hash_h,
              7 => sub_hash_h,
              8 => sub_hash_h.merge({5 => "Double if possible, otherwise hit", 6 => "Double if possible, otherwise hit"}),
              9 => sub_hash_h.merge({2 => "Double if possible, otherwise hit", 3 => "Double if possible, otherwise hit", 4 => "Double if possible, otherwise hit", 5 => "Double if possible, otherwise hit", 6 => "Double if possible, otherwise hit"}),
              10 => sub_hash_dh.merge({10 => "Hit", 11 => "Hit"}),
              11 => sub_hash_dh,
              12 => sub_hash_h.merge({4 => "Stand", 5 => "Stand", 6 => "Stand"}),
              13 => sub_hash_h.merge({2 => "Stand", 3 => "Stand", 4 => "Stand", 5 => "Stand", 6 => "Stand"}),
              14 => sub_hash_h.merge({2 => "Stand", 3 => "Stand", 4 => "Stand", 5 => "Stand", 6 => "Stand"}),
              15 => sub_hash_h.merge({2 => "Stand", 3 => "Stand", 4 => "Stand", 5 => "Stand", 6 => "Stand"}),
              16 => sub_hash_s,
              17 => sub_hash_s,
              18 => sub_hash_s,
              19 => sub_hash_s,
              20 => sub_hash_s,
              21 => sub_hash_s
}

soft_hash = { 13 => sub_hash_h.merge({4 => "Double if possible, otherwise hit", 5 => "Double if possible, otherwise hit", 6 => "Double if possible, otherwise hit"}),
              14 => sub_hash_h.merge({4 => "Double if possible, otherwise hit", 5 => "Double if possible, otherwise hit", 6 => "Double if possible, otherwise hit"}),
              15 => sub_hash_h.merge({4 => "Double if possible, otherwise hit", 5 => "Double if possible, otherwise hit", 6 => "Double if possible, otherwise hit"}),
              16 => sub_hash_h.merge({4 => "Double if possible, otherwise hit", 5 => "Double if possible, otherwise hit", 6 => "Double if possible, otherwise hit"}),
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

puts "What is your first card?"
player_card_1 = gets.chomp
if player_card_1 == "A" || player_card_1 == "a"
   player_card_1 == 11
end

puts "What is your second card?"
player_card_2 = gets.chomp
if player_card_2 == "A" || player_card_2 == "a"
   player_card_2 == 11
end

#if player_card_1 == player_card_2

cards_value = total(player_card_1, player_card_2)
puts "Player card value is #{cards_value}"

puts "What is the dealer's card?"
dealer_card = gets.chomp.to_i
if dealer_card == "A" || dealer_card == "a"
   dealer_card == 11
end

if player_card_1 == player_card_2
  ideal_move = pair_hash
elsif player_card_1 == 11 || player_card_2 == 11
  ideal_move = soft_hash
else
  ideal_move = hard_hash
end
puts "Your ideal move is: #{ideal_move[cards_value][dealer_card]}"





#puts hard_hash[player_value][dealer_card]

#puts "Your ideal move is: #{hard_hash[player_value][dealer_card]}" #output move








#LAST LINE puts big_hash[t][d][h]

#make a hash of hashes with key as user cards, hash within as deaelr card with action, and use a default
#hard_hash[5] = sub_hash
#{2 => "H", 3 => "H", 4 => "H", 5 => "H"} #6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
#hard_hash[6] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[7] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[8] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[9] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[10] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[11] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[12] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[13] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[14] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[15] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[17] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[18] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[19] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[20] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }
# hard_hash[21] = {2 => , 3 => , 4 => , 5 => , 6 => , 7 => , 8 => , 9 => , 10 => , "A" => }


# hard_hash = Hash.new("stand")
# hard_hash[5] = "Hit"
# hard_hash[6] = "Hit"
# hard_hash[7] = "Hit"
# hard_hash[8] = ["Hit", "Dh"]
# hard_hash[9]
# hard_hash[10]
# hard_hash[11]
# hard_hash[12]
# print hard_hash
#
# if dealer_card(#some range)
#   hard_hash[8][0]
# 0


# #this method would
# hard_hash[5] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# hard_hash[6] = { }, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'A']
