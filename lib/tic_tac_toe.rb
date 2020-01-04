WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
  
def display_board(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    puts "display_board"
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 
  
def input_to_index(move)
    index = move.to_i - 1 
    index 
end 
  
def move(board, index, token)
  board[index] = token
end 
    
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
  end 
 
def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true 
  else
    return false 
  end 
end

def turn(board)
  puts "take yo turn bitch"
  user_input = gets.strip
  index = input_to_index(user_input)
  token = current_player(board)
  if valid_move?(board, index)
    puts "I guess thats a good move, chump"
    move(board, index, token)
    display_board(board)
  else 
    puts "Nuh uh Motha fucka"
    turn(board)
  end 
  display_board(board)
end 

def turn_count(board)
   counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter +=1
  end
end
return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    current_player = "X"
  else
    current_player = "O"
end
return current_player
end

def won?(board)
   WIN_COMBINATIONS.each do |win_combo|
    if check_win_combination?(board, 'X', win_combo)
      return win_combo
    elsif check_win_combination?(board, 'O', win_combo)
      return true 
      puts win_combo
    else
      return false
    end
  end
end

def check_win_combination?(board, player, win_combo)
  win_combo.all? do |position|
    board[position] == player
  end
end

def full?(board)
   if board.include?(' ') || board.include?('')
    return false
else
    return true
  end
end 

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  puts 'is it over?'
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    puts 'no keep going'
    return false
  end
end

def winner(board)
  if !won?(board)
    return nil
  else WIN_COMBINATIONS.each do |win_combo|
    if check_win_combination?(board, 'X', win_combo)
      return 'X'
    elsif check_win_combination?(board, 'O', win_combo)
      return 'O'
    end
  end
end
end

def play(board)
  until over?(board) == true || won?(board) != false
  puts 'turn'
    turn(board)
  end
  if winner(board)
    puts "Congratulations!"
  elsif draw?(board)
    puts "Draw!"
  else
    return nil
  end
end