class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :article, null: false
      t.references :user, null: false
      t.timestamps null: false
    end
  end
end
