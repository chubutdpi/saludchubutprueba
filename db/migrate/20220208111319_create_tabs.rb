class CreateTabs < ActiveRecord::Migration[5.2]
  def change
    create_table :tabs do |t|
      t.string :title
      t.text :description
      t.belongs_to :page, foreign_key: true

      t.timestamps
    end
  end
end
