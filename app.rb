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

get '/api/cat'

# require 'active_record'
# require 'yaml'
# require_relative 'model/cat'
#
# ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
#
# before do
#   content_type :json
# end
#
# after do
#   ActiveRecord::Base.connection.close
# end
#
# # POST /api/ - create, read request body as JSON
# post '/api/' do
#   thing = Class.create(
#     name: params['name'],
#     number: params['number']
#   )
#
#   status 201
#   thing.to_json
# end
#
# # GET /api/ - return individual/all as JSON
# get '/api/' do
#   name = params['name']
#   number = params['number']
#
#
#   if !name.nil?
#     thing = Class.where(name: name)
#   elsif !number.nil?
#     thing = Class.where(number: number)
#   else
#     thing = Class.all.order(name: :DESC, number: :ASC)
#   end
#
#   thing.to_json
# end
#
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
# # DELETE /api/ - delete & return success/failure status code
# delete '/api/thing/:id' do |id|
#   thing = Class.find_by_id(id)
#   thing.destroy
# end
