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


def get_player_stats(stats, player_name)
  stats.each do |origin, team_stats|
    team_stats[:players].each do |player_stats|
      return player_stats if player_stats[:player_name] == player_name
    end 
  end 
end 

def stat_lookup(player_name, stat)
  stats = game_hash()
  player_stats = get_player_stats(stats, player_name)
  player_stats[stat]
end

def num_points_scored(player_name)
  stat_lookup(player_name, :points)
end 

def shoe_size(player_name)
  stat_lookup(player_name, :shoe)
end 

def find_team_loc(stats, team_name)
  stats[:home][:team_name] == team_name ? :home : :away
end 

def team_colors(team_name)
  stats = game_hash()
  location = find_team_loc(stats, team_name)
  stats[location][:colors]
end 

def team_names()
  stats = game_hash()
  [stats[:home][:team_name], stats[:away][:team_name]]
end 

def player_numbers(team_name) 
  stats = game_hash()
  location = find_team_loc(stats, team_name)
  numbers = stats[location][:players].collect do |player_stats| 
    player_stats[:number]
  end 
end 

def player_stats(player_name)
  stats = game_hash()
  get_player_stats(stats, player_name)
end 

def best_stat_player(game_stats, stat)
  best_stat = nil
  game_stats.each do |loc, team_stats|
    team_stats[:players].each do |player_stat|
      best_stat = player_stat if best_stat == nil || player_stat[stat] > best_stat[stat]
    end 
  end 
  best_stat
end 

def big_shoe_rebounds()
  game_stats = game_hash()
  player_stat = best_stat_player(game_stats, :shoe)
  player_stat[:rebounds]
end 

  
  

  