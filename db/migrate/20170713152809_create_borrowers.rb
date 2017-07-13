class CreateBorrowers < ActiveRecord::Migration[5.0]
  def change
    create_table :borrowers do |t|
      t.string :given_name
      t.string :family_name

      t.timestamps
    end
  end
end
