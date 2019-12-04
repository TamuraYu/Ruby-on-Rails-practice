class ModifySongs2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :updated_at
  end
end
