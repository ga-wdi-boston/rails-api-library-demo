class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :given_name, null:false
      t.string :family_name, null:false

      t.timestamps
    end
  end
end
