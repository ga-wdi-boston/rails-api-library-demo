# frozen_string_literal: true

class CreateBorrowers < ActiveRecord::Migration[5.0]
  def change
    create_table :borrowers do |t|
      t.string :given_name, null: false
      t.string :family_name, null: false

      t.timestamps null: false
    end
  end
end
