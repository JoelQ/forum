class CreateCategoryRoles < ActiveRecord::Migration
  def change
    create_table :category_roles do |t|
      t.integer :user_id
      t.integer :category_id
      t.boolean :moderator
      t.boolean :banned

      t.timestamps
    end
  end
end
