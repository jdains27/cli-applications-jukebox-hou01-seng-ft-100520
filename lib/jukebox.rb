# Add your code here
def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  (1..songs.length).zip(songs).each do |song|
    puts "#{song[0]}. #{song[1]}"
  end
end

def play(songs)
  puts "Please enter a song name or number:" 
  song = gets.strip 
  if song.match? /\A\d+\z/ 
    song = song.to_i 
  end
  numbered = (1..songs.length).zip(songs) 
  phrase = nil 
  numbered.each do |num_song| 
    if num_song.include?(song) 
        phrase = "Playing #{num_song[1]}" 
        break 
    else
      phrase = "Invalid input, please try again"
    end
  end
  puts phrase 
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  puts "Please enter a command:" # prompt user for input
  input = gets.strip # store input as input
  until input == 'exit' do # until user input is exit do
    help if input == 'help' # call help if input is help
    list(songs) if input == 'list' # call list if input is list
    play(songs) if input == 'play' # call play is input is play
    puts "Please enter a command:" # prompt user for next command
    input = gets.strip # store command as var input
  end
  exit_jukebox # once command is exit, call exit_jukebox 
end