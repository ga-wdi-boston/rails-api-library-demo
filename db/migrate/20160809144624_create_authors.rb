class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :given_name
      t.string :surname

      t.timestamps null: false
    end
  end
end
