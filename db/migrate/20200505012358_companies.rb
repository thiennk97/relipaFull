class Companies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :avatar
      t.string :title
      t.text   :content
      t.string :type_company
      t.string :address
    end
  end
end
