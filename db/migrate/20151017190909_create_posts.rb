class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :rating, :default => 0
      t.text :article
      t.references :post
      t.references :user
      t.timestamps null: false
    end
  end
end
