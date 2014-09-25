class AddTrackRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :track, index: true
  end
end
