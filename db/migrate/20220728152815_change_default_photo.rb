class ChangeDefaultPhoto < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :photo, 'https://source.unsplash.com/random')
  end
end
