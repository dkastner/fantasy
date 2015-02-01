module Fantasy
  module Repo

    class Player
      include DataMapper::Resource

      has n, :appearances

      storage_names[:default] = 'players'

      property :code, String, key: true
      property :lastname, String
      property :firstname, String
      property :bats, String
      property :throws, String
    end

  end
end
