class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title,            null: false
      t.string     :city,             null: false
      # t.references :user,             null: false, foreign_key: true
      t.references :country,          null: false, foreign_key: true
      t.references :situation,        null: false, foreign_key: true
      t.string     :purpose,          null: false
      t.text       :content,          null: false
      t.text       :free_description, null: false
      t.timestamps
    end
  end
end
