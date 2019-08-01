class CreatePostImages < ActiveRecord::Migration[5.1]
  def change
    create_table :post_images do |t|
      t.references :post, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
