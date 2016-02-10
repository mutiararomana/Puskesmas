class CreateResepSearches < ActiveRecord::Migration
  def change
    create_table :resep_searches do |t|

      t.timestamps null: false
    end
  end
end
