class CreateUserNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_notifications do |t|
      # t.references :user,                        null: false, foreign_key: true
      t.references :public_consultation,                      foreign_key: true
      t.references :public_consultation_comment,              foreign_key: true
      t.references :direct_consultation,                      foreign_key: true
      t.references :direct_consultation_comment,              foreign_key: true
      t.integer    :is_read,                     null: false, default: 0
      t.timestamps
    end
  end
end
