class AddUserIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :user, null: false, foreign_key: true, default: User.first.id
    #Ex:- :default =>''
  end
end
