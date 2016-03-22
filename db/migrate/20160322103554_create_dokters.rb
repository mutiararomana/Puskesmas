class CreateDokters < ActiveRecord::Migration
  def change
    create_table :dokters do |t|
      t.string :nama

      t.timestamps null: false
    end
  end
end
