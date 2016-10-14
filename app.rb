require 'sinatra'
require_relative 'models/cat'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

post '/api/cat' do
  cat = Cat.new(
    name: params[:name],
    gender: params[:gender],
    species: params[:species],
    attitude: params[:attitude]
  )

  if cat.valid? && cat.save
    status 201
    content_type :json
    cat.to_json
  else
    status 400
  end
end

get '/api/cats' do
  name = params['name']
  gender = params['gender']
  species = params['species']
  attitude = params['attitude']

  if !name.nil?
    cat = Cat.where(name: name)
  elsif !gender.nil?
    cat = Cat.where(gender: gender)
  elsif !species.nil?
    cat = Cat.where(species: species)
  elsif !attitude.nil?
    cat = Cat.where(attitude: attitude)
  else
    cat = Cat.all.order(name: :DESC)
  end

  status 200
  cat.to_json
end

put '/api/cat/:id' do |id|
  status 200
end
# # PUT /api/ - update & read request body as JSON
# put '/api/thing/:id' do |id|
#   name = params['name']
#   number = params['number']
#
#   thing = Class.find_by_id(id)
#
#   thing.update(name: name) unless name.nil?
#   thing.update(number: number) unless number.nil?
#
#   status 200
#   thing.to_json
# end
#

delete '/api/thing/:id' do |id|
#   thing = Class.find_by_id(id)
#   thing.destroy
end
