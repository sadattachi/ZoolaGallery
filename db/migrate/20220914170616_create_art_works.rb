class CreateArtWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :art_works do |t|
      t.integer :user_id
      t.string :title
      t.string :attachment

      t.timestamps
    end
  end
end
