class CreateArticleImages < ActiveRecord::Migration[6.0]
  def change
    create_table :article_images do |t|
      t.string     :image
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
