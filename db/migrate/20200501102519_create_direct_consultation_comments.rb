class CreateDirectConsultationComments < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_consultation_comments do |t|
      t.references :direct_consultation, null: false, foreign_key: true
      # t.references :user,                null: false, foreign_key: true
      t.string     :title,               null: false
      t.text       :content,             null: false
      t.timestamps
    end
  end
end
