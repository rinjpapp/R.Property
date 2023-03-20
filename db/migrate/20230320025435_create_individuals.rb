class CreateIndividuals < ActiveRecord::Migration[6.0]
  def change
    create_table :individuals do |t|
      t.string     :last_name,       null: false
      t.string     :first_name,      null: false
      t.string     :last_name_kana,  null: false
      t.string     :first_name_kana, null: false
      t.date       :birth_day,       null: false
      t.integer    :phone_id,        null: false
      t.string     :phone_number,    null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
