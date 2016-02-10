class CreatePolis < ActiveRecord::Migration
  def change
    create_table :polis do |t|
      t.string :nama

      t.timestamps null: false
    end
  end
end
