class CreateSiteGroups < ActiveRecord::Migration
  def change
    create_table :site_groups do |t|
      t.string :name

      t.timestamps
    end

    create_table :site_groups_sites do |t|
        t.belongs_to :SiteGroup
        t.belongs_to :Site

    end

    create_table :site_groups_campaigns do |t|
      t.belongs_to :SiteGroup
      t.belongs_to :Campaign

    end
  end
end
