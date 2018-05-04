class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :name
      t.string :url
      t.string :avatar_url
      t.string :provider

      t.timestamps
    end
  end
end
