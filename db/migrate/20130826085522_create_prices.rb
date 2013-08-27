class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :price_for_thousand
      t.date :start_date
      t.date :end_date
      t.belongs_to :SiteGroup

      t.timestamps
    end
  end
end
