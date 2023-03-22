class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer    :room_number,    null: false
      t.integer    :rent,           null: false
      t.integer    :management_fee, null: false
      t.integer    :deposit,        null: false
      t.integer    :key_money,      null: false
      t.string     :layout,         null: false
      t.decimal    :floor_area,     null: false, precision: 4, scale: 1
      t.date       :available_date, null: false
      t.bigint     :admin,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
