class ModifyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :recent1, :integer, null: false, default:1
    add_column :users, :recent2, :integer, null: false, default:2
    add_column :users, :recent3, :integer, null: false, default:3
    add_column :users, :recent4, :integer, null: false, default:4
    add_column :users, :recent5, :integer, null: false, default:5
    
  end
end