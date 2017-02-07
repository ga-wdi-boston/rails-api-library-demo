# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.references :borrower, foreign_key: true, null: false, index: true
      t.references :book, foreign_key: true, null: false, index: true
      t.date :due_on, null: false

      t.timestamps null: false
    end
  end
end
