module Fantasy
  module Repo

    class Team
      include DataMapper::Resource

      storage_names[:default] = 'teams'

      has n, :players

      property :code, String, key: true
      property :league, String
      property :city, String
      property :name, String
    end

  end
end
