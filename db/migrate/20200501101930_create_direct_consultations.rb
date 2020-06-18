class CreateDirectConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_consultations do |t|
      # t.references :user,        null: false, foreign_key: true
      # t.references :advice_user, null: false, foreign_key: { to_table: :users }
      t.string     :title,       null: false
      t.text       :content,     null: false
      t.timestamps
    end
  end
end
