class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :like_count, default: 0
      t.references :user, null: false
      t.timestamps null: false
    end
  end
end
