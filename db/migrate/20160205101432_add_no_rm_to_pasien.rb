class AddNoRmToPasien < ActiveRecord::Migration
  def change
    add_column :pasiens, :no_rm, :string
  end
end
