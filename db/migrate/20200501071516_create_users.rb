class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string     :nickname,           null: false, default: ""
      t.string     :email,              null: false, default: ""
      t.string     :password_digest,    null: false, default: ""
      t.integer    :age_id
      t.integer    :profession_id
      t.integer    :gender_id
      t.references :situation,           foreign_key: true
      t.references :country,             foreign_key: true
      t.references :experience_country,  foreign_key: { to_table: :countries }
      t.string     :duration
      t.text       :profile
      t.timestamps
    end

    add_index :users, :email,            unique: true
  end
end
