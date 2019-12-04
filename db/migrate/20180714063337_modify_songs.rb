class ModifySongs < ActiveRecord::Migration[5.2]
  def change
    # add_column :DB名, :名前, :型 参照P185
    add_column :songs, :composer, :string
    add_column :songs, :Lyricist, :string
    add_column :songs, :singer, :string
  end
end
