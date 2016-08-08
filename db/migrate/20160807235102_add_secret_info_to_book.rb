class AddSecretInfoToBook < ActiveRecord::Migration
  def change
    add_column :books, :secret_info, :string
  end
end
