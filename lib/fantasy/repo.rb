module Fantasy

  module Repo

    def self.load_all
      require 'data_mapper'
      DataMapper.setup :default, ENV.fetch('DATABASE_URL')
      Dir[path].each { |f| require f }
      DataMapper.finalize

      migrate
    end

    def self.path
      File.expand_path('../repo/**/*.rb', __FILE__)
    end

    def self.migrate
      require 'dm-migrations'
      DataMapper.auto_migrate!
    end

  end

end
