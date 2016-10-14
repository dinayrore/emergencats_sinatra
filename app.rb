require 'sinatra'
require_relative 'models/cat'
require 'active_record'

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
  cat = Cat.find_by_id(id)
  cat.update(name: params[:name]) unless params[:name].nil?
  cat.update(attitude: params[:attitude]) unless params[:attitude].nil?
  status 200
  cat.to_json
end

delete '/api/cat/:id' do |id|
  cat = Cat.find_by_id(id)
  cat.destroy
  status 200
  Cat.all.to_json
end
