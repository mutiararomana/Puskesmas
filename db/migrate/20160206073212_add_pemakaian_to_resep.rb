class AddPemakaianToResep < ActiveRecord::Migration
  def change
    add_column :reseps, :pemakaian, :string
  end
end
