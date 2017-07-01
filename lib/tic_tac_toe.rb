board = [" "," "," "," "," "," "," "," "," "]

WIN_COMBINATIONS =
[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[2,5,8],[1,4,7],[0,3,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(user_input)

  user_input = user_input.to_i
  i = user_input - 1

end
def move(board,user_input,character)
if character != "X" || character != "O"
  false
else
   board[user_input] = character
end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board,index)
  if index.between?(0,9) == true
    if board[index] == (" ") || board[index] == ("") || board[index] == (nil)
    return false
  else
    return true
    end
  end
end
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def update_array_at_with(array, index, value)
  array[index] = value
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(board,index) == false
  turn(board)

elsif valid_move?(board,index) == true && character == "X"

    move(board,index,character = "X")
    display_board(board)
elsif valid_move?(board,index) == true && character == "O"
  move(board,index,character = "O")
  display_board(board)

end
end
board = ["X"," "," ","O"," "," "," "," ","X"]
def turn_count(board)

count = 0
board.each do |character|
  if character == "X" || character == "O"
count += 1

end
end
count
end

def current_player(board)
  if turn_count(board) % 2 == 0
   "X"
  else
   "O"
  end

end


def won?(board)
if board[0] == "X" && board[1] == "X" && board[2] == "X" || board[0] == "O" && board[1] == "O" && board[2] == "O"
  WIN_COMBINATIONS[0]
elsif board[3] == "X" && board[4] == "X" && board[5] == "X" || board[3] == "O" && board[4] == "O" && board[5] == "O"
  WIN_COMBINATIONS[1]
elsif board[6] == "X" && board[7] == "X" && board[8] == "X" || board[6] == "O" && board[7] == "O" && board[8] == "O"
  WIN_COMBINATIONS[2]
elsif board[0] == "X" && board[4] == "X" && board[8] == "X" || board[0] == "O" && board[4] == "O" && board[8] == "O"
  WIN_COMBINATIONS[3]
elsif board[2] == "X" && board[4] == "X" && board[6] == "X" || board[2] == "O" && board[4] == "O" && board[6] == "O"
  WIN_COMBINATIONS[4]
elsif board[2] == "X" && board[5] == "X" && board[8] == "X" || board[2] == "O" && board[5] == "O" && board[8] == "O"
  WIN_COMBINATIONS[5]
elsif board[1] == "X" && board[4] == "X" && board[7] == "X" || board[1] == "O" && board[4] == "O" && board[7] == "O"
  WIN_COMBINATIONS[6]
elsif board[0] == "X" && board[3] == "X" && board[6] == "X" || board[0] == "O" && board[3] == "O" && board[6] == "O"
  WIN_COMBINATIONS[7]
else
  false

end
end
  board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  board = ["X", " ", "X", "O", " ", "X", "O", " ", "O"]
def full?(board)
  if board.include?(" ")
    false
  else
    true

  end
end
board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
end
end

def over?(board)
  if draw?(board) == true || won?(board) != false || full?(board) == true
    true
  else
    false
  end
end
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
def winner(board)
  if won?(board) == WIN_COMBINATIONS[0]
    board[0]
  elsif won?(board) == WIN_COMBINATIONS[1]
    board[3]
  elsif won?(board) == WIN_COMBINATIONS[2]
    board[6]
  elsif won?(board) == WIN_COMBINATIONS[3]
    board[0]
  elsif won?(board) == WIN_COMBINATIONS[4]
    board[2]
  elsif won?(board) == WIN_COMBINATIONS[5]
    board[2]
  elsif won?(board) == WIN_COMBINATIONS[6]
    board[1]
  elsif won?(board) == WIN_COMBINATIONS[7]
    board[0]
  else
  end
end

def play(board)
turn(board)

  if over?(board) == false && won?(board) == false && draw?(board) == false
    play(board)
  elsif won?(board) == true && over?(board) == true
  return "Congratulations, you won the game!"
elsif over?(board) == true && draw?(board) == true
    return "Cats Game!"
end
end
play(board)
