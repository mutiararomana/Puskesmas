class AddSatuanToObat < ActiveRecord::Migration
  def change
    add_column :obats, :satuan, :string
  end
end
