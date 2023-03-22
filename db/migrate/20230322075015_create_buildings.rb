class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string  :building_name, null: false
      t.string  :post_code,     null: false
      t.integer :prefecture_id, null: false
      t.string  :city,          null: false
      t.string  :address,       null: false
      t.string  :access,        null: false
      t.date    :build_year,    null: false
      t.integer :story,         null: false
      t.bigint  :admin,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
