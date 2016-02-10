class CreateKategoris < ActiveRecord::Migration
  def change
    create_table :kategoris do |t|
      t.string :nama

      t.timestamps null: false
    end
  end
end
