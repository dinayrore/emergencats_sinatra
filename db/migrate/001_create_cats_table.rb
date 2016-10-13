require 'active_record'
#
class CreateCatsTable < ActiveRecord::Migration[5.0]
  def up
    create_table :cats do |c|
      c.string :name
      c.string :gender
      c.string :species
      c.string :attitude
    end
  end

  def down
    drop_table :cats
  end
end

def main
  action = (ARGV[0] || :up).to_sym

  CreateCatsTable.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
