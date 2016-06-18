# open terminal and run 'gem install mongo' before executing this code
# remove comment tags according to what you want to do
# nivigate to db folder and run 'ruby seed.rb' to execute this code

require 'mongo'
require 'date'
include Mongo


mongo_client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'iit-data')
mongo_client.database.drop
measures = mongo_client[:measures]

devices = ['device1', 'device2', 'device3']

# populate measures collection with 20 records for each device
devices.each do |d|
  20.times do |i|
    record = {device: d, temperature: Random.new.rand(0.1..50.1), pressure: Random.new.rand(0.1..50.1), datetime: DateTime.now}
    measures.insert_one(record)
  end
end

# print number of records in measures collection
puts 'Number of records: ' + measures.find().count.to_s

# get all measures where device = device1
# d1_measures = measures.find(device: 'device1')

# print each one of those measures
# d1_measures.each do |m|
#   puts m
# end

# print the number of records from device1
# puts d1_measures.count

# delete measures from device1
# deleted_records = measures.delete_many(device: 'device1')
# puts deleted_records.n

# print all collections in the database
# puts mongo_client.database.collection_names

