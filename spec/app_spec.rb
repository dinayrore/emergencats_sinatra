require 'json'
require 'active_record'
require_relative '../models/cat'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

describe 'The Emergencats App' do
  before do
    @cat = {
      'name' => 'Rufus',
      'gender' => 'M',
      'species' => 'Mix',
      'attitude' => 'Feisty'
    }
  end

  describe 'POST /api/cat' do
    it 'creates a cat' do
      post '/api/cat', @cat
      expect(last_response.status).to eq(201)
      expect(Cat.last.name).to eq(@cat['name'])
      expect(Cat.last.gender).to eq(@cat['gender'])
      expect(Cat.last.species).to eq(@cat['species'])
      expect(Cat.last.attitude).to eq(@cat['attitude'])
    end
  end

  describe 'GET /api/cats' do
    it 'searches for a cat by name' do
      get '/api/cats?name=Rufus'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to contain('Rufus')
    end

    it 'searches for a cat by attitude' do
      get '/api/cats?attitude=Feisty'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to contain('Rufus')
    end
  end
end
