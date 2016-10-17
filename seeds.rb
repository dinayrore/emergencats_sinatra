require 'active_record'
require 'csv'
require_relative 'models/cats'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

#
class Cats
  def initialize(filename)
    @filename = filename
  end

  def load_from_file
    CSV.foreach(@filename, encoding: 'iso-8859-1', col_sep: '|') do |line|
      name = line[0]
      gender = line[1]
      species = line[2]
      attitude = line[3]

      User.create(name: name, gender: gender, species: species,
                  attitude: attitude)
    end
  end
end

def main
  user_data = Cats.new('data/cats.csv')

  user_data.load_from_file
end

main if __FILE__ == $PROGRAM_NAME
