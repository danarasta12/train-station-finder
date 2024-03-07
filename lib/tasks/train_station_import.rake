require 'csv'
require 'benchmark'

namespace :import do
  desc "imports stations data from csv to postgresql"
  task batch_record: :environment do
    stations = []
    CSV.foreach("app/liste_des_gares.csv", headers: true) do |row|
      stations << row
    end
    new_stations = stations.map do |attrs|
      Station.new(attrs)
    end
    begin
      time = Benchmark.realtime { Station.import(new_stations) }
      puts "Importation terminée en #{time} secondes"
    rescue StandardError => e
      puts "Une erreur s'est produite lors de l'importation : #{e.message}"
    end
  end
end
