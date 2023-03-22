class AddBuildingRefToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :building, null: false, foreign_key: true
  end
end
