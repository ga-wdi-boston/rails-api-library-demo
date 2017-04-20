class PopulateAuthorsFromBooks < ActiveRecord::Migration[5.0]
  def up
    # insert full name data into family_name for splitting later
    execute <<~EOS
      INSERT INTO authors(family_name)
      SELECT DISTINCT author
      FROM books
      ORDER BY author;
    EOS
  end

  def down
    execute <<~EOS
      UPDATE authors
      SET family_name = NULL;
    EOS
  end
end
