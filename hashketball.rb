# Write your code below game_hash

require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

###### -------------- # Write code here -----------

def num_points_scored(players_name) 
  
  game_hash.each do |team_location, team_name_color_info|
    team_name_color_info[:players].each do |player_data|
      if (player_data[:player_name] == players_name)
        return player_data[:points]
      end
    end
  end 
end

def shoe_size(name_of_player) ------- #to not confuse myself with player_name key/value pair
  
  game_hash.each do |team_location, team_data| 

    team_data[:players].each do | player_name |
      if (player_name[:player_name] == name_of_player)
        return player_name[:shoe]
      end
    end 
  end 
  
end 


def team_colors(team_name)
  
  game_hash.each do |team_location, team_name_color_info|
      if team_name_color_info[:team_name] == team_name
        return team_name_color_info[:colors]
      end 
  end 
  
end 

def team_names
  # --- returns array --- **
  
  team_names_arr = []
  
  game_hash.each do |team_location, team_name_color_info|
     team_name_color_info.each do |team_name_key, team_name_value|
       if team_name_key == :team_name
         team_names_arr.push(team_name_value) #Note to self - pushing :team_names into empty array
        end
     end
  end 
  return team_names_arr
end 

def player_numbers(team_name)
  jersey_numbers = []
  
  game_hash.each do |team_location, team_name_color_info|
     if (team_name_color_info[:team_name] == team_name)
        team_name_color_info.each do |team_info_keys, team_data|
          if team_info_keys == :players
            team_data.each do | player_data |
              jersey_numbers.push(player_data[:number])
            end 
          end
        end 
      end 
    end
  return jersey_numbers
end


def player_stats(players_name)
  
  game_hash.each do |team_location, team_name_color_info|
    team_name_color_info.each do |team_info_keys, team_data|
      if team_info_keys == :players 
        team_data.each do | player_data |
          if (player_data[:player_name] == players_name)
            player_data.delete([:player_name])
            
            ## have to remove the name from this kvp since it isn't asking for it in the return prompt
            
            return player_data
          end
        end
      end
    end
  end
end

def big_shoe_rebounds 
  
  shoe_size = 0 
  rebounds_value = 0
  
  game_hash.each do |team_location, team_name_color_info|
    
    team_name_color_info[:players].each do |player_data|
      
      if (player_data[:shoe] > shoe_size)
          shoe_size = player_data[:shoe]

          rebounds_value = player_data[:rebounds]
      end 
    end
  end
  return rebounds_value
end #return number of rebounds with player with biggest shoe size

 
## naming variables well, how to debug, "detective work", binding.pry = best friend