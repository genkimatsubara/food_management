class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.string :url, null: false
      t.text :description

      t.timestamps
    end
  end
end
