class AddStatusToPasien < ActiveRecord::Migration
  def change
    add_column :pasiens, :status, :string
  end
end
