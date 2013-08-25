class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.belongs_to :manager
      t.string :name
      t.string :contact
      t.string :phone
      t.string :email
      t.string :address
      t.decimal :balance

      t.timestamps
    end
  end
end
