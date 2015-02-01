module Fantasy
  module Repo

    class Assignment
      include DataMapper::Resource

      storage_names[:default] = 'assignments'

      belongs_to :player
      belongs_to :team

      property :player_code
      property :team_code
      property :position, String
      property :year, Integer
    end

  end
end
