class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.references :borrower, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
