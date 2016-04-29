class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :movie, index: true ## movie_id
      t.string :text
      t.timestamps null: false
    end
  end
end
