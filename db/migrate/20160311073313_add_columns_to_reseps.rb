class AddColumnsToReseps < ActiveRecord::Migration
  def change
    add_column :reseps, :jumlah_masuk, :integer
    add_column :reseps, :penerimaan, :string
  end
end
