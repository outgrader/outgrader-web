class CreateAdPlaces < ActiveRecord::Migration
  def change
    create_table :ad_places do |t|
      t.decimal :size_x
      t.decimal :size_y
      t.belongs_to :site

      t.timestamps
    end
  end
end
