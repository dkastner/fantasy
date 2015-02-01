require 'csv'

module Fantasy
  module Importer

    class Retro

      def self.import_all(dir)
        require 'fantasy/repo'
        Fantasy::Repo.load_all

        Teams.import dir
        Rosters.import dir
      end

      class Group

        def self.import(dir)
          new(dir).import
        end

        attr_accessor :dir

        def initialize(dir)
          self.dir = dir
        end

      end

      class Teams < Group

        def import
          list = {}
          Dir[File.join(dir, 'TEAM201?')].each do |file|
            CSV.foreach(file) do |row|
              code, league, city, name = row

              list[code] = row
            end
          end

          list.each do |code, row|
            code, league, city, name = row

            puts "Team #{code}"
            Repo::Team.create code: code, league: league, city: city, name: name
          end
        end

      end

      class Rosters < Group

        def import
          players = {}
          Dir[File.join(dir, '*.ROS')].each do |file|
            CSV.foreach(file) do |row|
              year = File.basename(file)[3..6]
              code = row[0]
              row << year

              players[code] ||= []
              players[code] << row
            end
          end

          players.each do |code, rows|
            player = nil
            rows.each do |row|
              _, lastname, firstname, bats, throws, team, position = row
              if player.nil?
                puts "Player #{firstname} #{lastname}"
                player = Repo::Player.create code: code, lastname: lastname,
                  firstname: firstname, bats: bats, throws: throws
              end

              puts " * Assignment #{team} #{position}"
              Repo::Assignment.create team_code: team, player_code: code,
                position: position, year: year
            end
          end
        end

      end

    end

  end
end
