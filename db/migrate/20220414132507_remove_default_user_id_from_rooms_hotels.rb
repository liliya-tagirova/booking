
# frozen_string_literal: true

class RemoveDefaultUserIdFromRoomsHotels < ActiveRecord::Migration[6.1]
  def up
    change_column_default :hotels, :user_id, from: User.first.id, to: nil
    change_column_default :rooms, :user_id, from: User.first.id, to: nil
  end

  def down
    change_column_default :hotels, :user_id, from: nil, to: User.first.id
    change_column_default :rooms, :user_id, from: nil, to: User.first.id
  end
end
