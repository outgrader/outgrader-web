class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :url
      t.decimal :size_x
      t.decimal :size_y
      t.integer :customer_id

      t.timestamps
    end

    create_table :banners_campaigns do |t|
      t.belongs_to :Campaign
      t.belongs_to :Banner

    end
  end
end
