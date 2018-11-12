#creategrid
require "io/console"

def printgrid gridsize, grid 
	(0...gridsize).each do |i|
		(0...gridsize).each do |j|
			print grid[i][j]
			print " "
		end 
		puts
	end 
end

gridsize = 15 
treasure = "$"
pokemon = 9
wall = "-"
grass = "*" 
pokemon_x = 0
pokemon_y = 0
treasure_found = 0
number_of_treasure = 3   

input = ""


grid = Array.new(gridsize){Array.new(gridsize){grass}}
grid[1][3] = treasure
grid[6][3] = treasure
grid[2][2] = treasure
grid[3][3] = wall
grid[3][4] = wall
grid[3][5] = wall
grid[pokemon_x][pokemon_y] = pokemon
running = true 

while running 

#while input != "q\n" || treasure_found < 3
system "clear"

puts "Welcome to Chedgemaster. Use s for down, d for right, w for up,
and a for left to chedge up all your treasure and secure your place as the 
CHEDGEMASTER."

printgrid gridsize, grid 
input = STDIN.getch
grid [pokemon_x][pokemon_y] = grass


if input == "w" 
		if pokemon_x != 0 && grid[pokemon_x - 1][pokemon_y] != wall 
    pokemon_x = pokemon_x - 1
  end
end  

if input == "d" 
		if pokemon_y != gridsize - 1 && grid[pokemon_x][pokemon_y + 1] != wall 
    pokemon_y = pokemon_y + 1 
  end
end 

if input == "s"
	if pokemon_x != gridsize - 1 && grid[pokemon_x + 1][pokemon_y] != wall
    pokemon_x = pokemon_x + 1
  end
end 

if input == "a"
	if pokemon_y != 0 && grid[pokemon_x][pokemon_y - 1] != wall 
    pokemon_y = pokemon_y - 1 
  end  
end

if input == "q"
	running = false 
end 


#fully chedged
				
if grid[pokemon_x][pokemon_y] == treasure
		treasure_found = treasure_found + 1
end 		

grid [pokemon_x][pokemon_y] = pokemon
	
			if treasure_found > 2
				puts "YOU ARE THE CHEDGEMASTER" 
				running = false 
			end
end

