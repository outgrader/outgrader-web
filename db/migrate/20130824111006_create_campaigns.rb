class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.belongs_to :customer
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :budget
      t.string :status

      t.timestamps
    end
  end
end
