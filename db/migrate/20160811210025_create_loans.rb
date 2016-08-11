class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :author, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.datetime :date
    end
  end
end
