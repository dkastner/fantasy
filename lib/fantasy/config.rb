module Fantasy
  module Config

    def self.load_repos
      require 'fantasy/repo'
      Repo.load_all
    end

  end
end

