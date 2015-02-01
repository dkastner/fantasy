require 'bundler/setup'

task :import_all do
  require 'pasqual'
  psql = Pasqual.for ENV.fetch('DATABASE_URL')
  psql.dropdb rescue Pasqual::Dropdb::Failed
  psql.createdb

  require 'fantasy/importer/retro'
  Fantasy::Importer::Retro.import_all File.expand_path('../data/retro', __FILE__)
end
