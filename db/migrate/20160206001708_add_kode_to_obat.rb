class AddKodeToObat < ActiveRecord::Migration
  def change
    add_column :obats, :kode, :string
  end
end
