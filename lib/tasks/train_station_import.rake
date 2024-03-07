require 'csv'
require "benchmark"

namespace :import do
   desc "imports data from csv to postgresql"
   users = []
   task :batch_record => :environment do
       CSV.foreach(filename, headers: true) do |row|
           users << row
       end
       newusers = users.map do |attrs|
           User.new(attrs)
       end
       time = Benchmark.realtime {User.import(newusers)}
       puts time
   end
end
