class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: 'https://media.techtribune.net/uploads/2022/11/Naruto-640x360.jpg'
      t.text :bio
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end
