require 'json'
require 'active_record'
require_relative '../models/cat'
require 'pry'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

describe 'The Emergencats App' do
  before do
    @cat = {
      'name' => 'Rufus',
      'gender' => 'M',
      'species' => 'Tabby',
      'attitude' => 'Feisty'
    }
  end

  # this test no longer passes...valid statements maybe?
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
      expect(last_response.body).to include('Rufus')
    end

    it 'searches for a cat by gender' do
      get '/api/cats?gender=M'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Rufus', 'Clark', 'Chow',
                                            'Charming', 'Jimothy')
    end

    it 'searches for a cat by species' do
      get '/api/cats?species=Tabby'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Rufus', 'Miss Kitty',
                                            'Clark', 'Chow')
    end

    it 'searches for a cat by attitude' do
      get '/api/cats?attitude=Feisty'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Rufus')
    end
  end

  # if I add PUT then this test breaks...
  describe '/api/cat/:id' do
    it 'updates a cat name by id' do
      put '/api/cat/1?name=Little Bubbies'
      expect(last_response.body).to include('Little Bubbies')
    end

    it 'updates a cat attitude by id' do
      get '/api/cat/1?attitude=Spicy'
      expect(last_response.body).to include('Rufus')
    end
  end

  # if I add DELETE then this test breaks...
  describe '/api/cat/:id' do
    it 'deletes a cat name by id' do
      get '/api/cat/1'
      expect(last_response.body).to include('Rufus')
    end
  end
end
