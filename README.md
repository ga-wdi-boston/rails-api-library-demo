[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Rails API Many-To-Many Library Demo

1.  [Fork and clone](https://github.com/ga-wdi-boston/meta/wiki/ForkAndClone)
    this repository.
1.  Change into the new directory.
1.  Install dependencies with `bundle install`.
1.  Add secrets to `config/secrets.yml`.
1.  Create a database with `bundle exec rake db:create`.
1.  Create a database schema with `bundle exec rake db:migrate`.
1.  Run the HTTP server with `bundle exec rails server`.

## Where We Left Off

Previously we created a single model, `Book`.

Then we created a second model `Author` and linked it to `Book`.

Now we are going to add a third model: `Loan`. Which is going to act as a link
between the `Author`s and `Book`s.

This `Loan` model will join together `Author` and `Book`.  Earlier, when we
were working with a `one-to-many` relationship `books` belonged to an `author`.

We know this is a two way street however: `Books` can have many `Authors` and
`Authors` can have many `Books`.  When we created a migration:

```ruby
class AddAuthorToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :author, index: true, foreign_key: true
  end
end
```

We added an `author` reference column to the `books` table which is able to
store a reference to an author of a particular book.

In order to make this a two way street we are going to need a `join table`.

## Join Tables

A `join table` is a special table which holds refrences two or more tables.

Let's see what this table might look like:

![has_many_through](https://cloud.githubusercontent.com/assets/10408784/17598817/451a3662-5fca-11e6-8ad1-613d4e56970f.png)

<!-- Image from Rails Docs -->

In the above example the `appointments` table is the `join table`. You can see
it has both a `physician_id` column and a `patient_id` column.  Both of these
columns store refrences to their respective tables.

You can also see a column called `appointment_date`. You are allowed to add
other columns on to your `join table`, but do not necessarily have to.  In this
case it makes sense, in some cases it may not, use your judgement.

## Removing a Column

But wait! We forgot an important step! Yesterday we added an `author_id` column
to `books`. Let's remove that before we go any further and our API performs in
a way we don't expect.

We need to create a migration to remove that column, from the Rails Guides:

```markdown
If the migration name is of the form "AddXXXToYYY" or "RemoveXXXFromYYY" and is
followed by a list of column names and types then a migration containing the
appropriate add_column and remove_column statements will be created.
```

Knowing this we can construct a migration that removes this column for us:

```bash
rails g migration RemoveAuthorIdFromBooks author_id:integer
```

and this creates the following migration:

```ruby
class RemoveAuthorIdFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :author_id, :integer
  end
end
```

Now let's run this migration with `rake db:migrate` and we should be good to go.

## Making a Join Table

We're going to use the generators that Rails provides to generate a `loan` model
along with a `loan` migration that includes references to both `author` and
`book`.

```ruby
rails g scaffold loan author:references book:references date:datetime
```

Along with creating a `loan` model, controller, routes, and serializer, Rails
will create this migration:

```ruby
class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :author, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.datetime :date

      t.timestamps null: false
    end
  end
end
```

So our `Loan` table now has the following columns: ID, author_id, book_id, Date.

Let's run our migration with `rake db:migrate`

Let's take a peek at our database and see how this table looks. Simply type:

```bash
rails db
```

If your prompt looks like this `rails-api-library-demo_development=#` type:

```bash
\d loans
```

You will be able to see all the columns contained in the `loan` table.

## Through: Associated Records

While we can see that in the `loan` model some some code was added for us:

```ruby
class Loan < ActiveRecord::Base
  belongs_to :author
  belongs_to :book
end
```

But we need to go into our models (`author`, `book`, and `loan`) and add some
more code to finish creating our associations.

Let's go ahead and add that code starting with the `book` model:

```ruby
# Book Model
class Book < ActiveRecord::Base
  has_many :books, through: :loans
  has_many :loans
end
```

In our author model we will do something similar:

```ruby
# Author Model
class Author < ActiveRecord::Base
  has_many :books, through: :loans
  has_many :loans
end
```

Finally in our `loan` model we're going to update it to:

```ruby
class Loan < ActiveRecord::Base
  belongs_to :author, inverse_of: :loans
  belongs_to :book, inverse_of: :loans
end
```

What is `inverse_of` and why do we need it?

When you create a `bi-directional` (two way) association, ActiveRecord does not
necessarily know about that relationship.

*I say necessarily because in future versions of Rails this is/may be resolved*

Without `inverse_of` you can get some strange behavior like this:

```ruby
a = Author.first
b = a.books.first
a.first_name == b.author.first_name # => true
a.first_name = 'Lauren'
a.first_name == b.author.first_name # => false
```

Rails will store `a` and `b.author` in different places in memory, not knowing to
change one when you change the other. `inverse_of` informs Rails of the
relationship, so you don't have inconsistancies in your data.

*For more info on this please read the [Rails Guides](http://guides.rubyonrails.org/association_basics.html)*

## Adding Via ActiveRecord

First, let's open our Rails console with `rails console`

And Let's create some books and authors

```ruby
# books
book1 = Book.create([{ title: 'Less Funny Than Jason'}])
book2 = Book.create([{ title: 'How I Miss Meat!'}])
book3 = Book.create([{ title: 'Lauren is on fleek'}])
book4 = Book.create([{ title: 'I am a Robot: Beep Boop'}])

#authors
author1 = Author.create([{ given_name: 'Lauren', surname: 'Fazah'}])
author2 = Author.create([{ given_name: 'Jason', surname: 'Weeks'}])
author3 = Author.create([{ given_name: 'Antony', surname: 'Donovan'}])
```
Close the rails console and check `localhost:3000/books` and
`localhost:3000/authors` to see if we have created books and authors.






## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
