class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.references :user
      t.references :post
      t.boolean :voting_record

      t.timestamps null: false
    end
  end
end
