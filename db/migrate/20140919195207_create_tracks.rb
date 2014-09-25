class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :link_url
      t.string :task

      t.timestamps
    end
  end
end
