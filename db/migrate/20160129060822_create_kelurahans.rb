class CreateKelurahans < ActiveRecord::Migration
  def change
    create_table :kelurahans do |t|
      t.string :nama

      t.timestamps null: false
    end
  end
end
