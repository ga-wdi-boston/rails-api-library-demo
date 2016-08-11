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
columns store refrences to their respective tables

## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
