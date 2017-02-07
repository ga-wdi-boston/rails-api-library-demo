# frozen_string_literal: true

class MoveAuthorFromBooksToAuthors < ActiveRecord::Migration[5.0]
  # def authors
  #   Book.all.pluck(:author).map do |author|
  #     author.split(' ')
  #   end
  # end
  #
  # def author_to_names(author)
  #   names = {}
  #   names[:given_name] = if author.length == 3
  #                          "#{author[0]} #{author[1]}"
  #                        else
  #                          author.first
  #                        end
  #   names[:surname] = author.last
  #   names
  # end
  #
  # def create_authors
  #   authors.each do |author|
  #     author_params = author_to_names(author)
  #
  #     next if Author.find_by(author_params)
  #     Author.create!(author_params)
  #   end
  # end
  #
  # def associate_authors_with_books
  #   Author.all.each do |author|
  #     name = "#{author.given_name} #{author.surname}"
  #     Book.where(author: name).each do |book|
  #       book.update!(author: author)
  #     end
  #   end
  # end
  #
  # def up
  #   create_authors
  #   associate_authors_with_books
  # end
  #
  # def down
  #   raise ActiveRecord::IrreversibleMigration
  # end
end
