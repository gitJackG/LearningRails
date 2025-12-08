class AddSlugToTodos < ActiveRecord::Migration[8.1]
  def change
    add_column :todos, :slug, :string
    add_index :todos, :slug, unique: true
  end
end
