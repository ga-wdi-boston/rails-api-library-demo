[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Rails API single Demo

## Prerequisites

-   Ruby

## Objectives

By the end of this lesson, students should be able to:

-   Explain why a back-end is necessary.
-   List some of the responsibilities of a typical back-end, and identify which
components within (R)MVC map to those responsibilities.
-   Map (R)MVC roles to specific components of Rails.
-   Indicate where different types of files can be found within a Rails
application.
-   Bear witness to the creation of an API.

## Preparation

1.  [Fork and clone](https://github.com/ga-wdi-boston/meta/wiki/ForkAndClone)
    this repository.
1.  Create a new branch, `training`, for your work.
2.  **DO NOT INSTALL DEPENDENCIES**

## Dependencies

-   [`rails-api`](https://github.com/rails-api/rails-api)
-   [`rails`](https://github.com/rails/rails)
-   [`active_model_serializers`](https://github.com/rails-api/active_model_serializers)
-   [`ruby`](https://www.ruby-lang.org/en/)
-   [`postgres`](http://www.postgresql.org)

## Who Needs A Back-End

In Unit 1, each of you built a front-end application; it had a UI and behavioral
logic, allowing users to play Tic Tac Toe in the browser. Isn't that enough? Why
might we want a back-end?

One possible reason is that when two different people are served up a web page,
they each have a _separate copy_ of everything on the page. As a result, if we
have two users interacting with our app, _they can never interact with each
other, or even be aware of each other_. That significantly hampers what our app
is capable of doing.

Another possible reason is that we might want want to store the state of the
game over time. What if we wanted to be able to 'save' our game, close the
browser, walk away, and pick it up again the next day? Having a back-end where
data is stored means that we can do just that.

> There are some workarounds that might allow us to have **persistence** (things
> being saved over time) in the browser alone; however, this is a more advanced
> topic, and won't be touched on today.

Fortunately, in the Unit 1 Project, you were given a pre-built back-end that
could do all of those things. But how did it do them?

### Your Turn :: Design Your Own Back-End

In your squads, take fifteen minutes (and a patch of whiteboard), and write out
all the different things that you think that the back-end to your Tic Tac Toe
apps needed to do in order to work correctly. Then, once you've done this, take
a second look at what you've written down. Assuming you were to try to build a
Ruby program to handle all of these different tasks, what abstractions would you
need? How would the different responsibilities be broken up? Make a list.

Once all groups are finished, we'll be sharing out our results and having a
class-wide discussion.

### One Possible Solution :: (R)MVC

Suppose we wanted to build an back-end app that records a user's height and
weight. It might work as follows:

1.  A user interacts with a front-end application, triggering a POST, and this POST
request contains data - specifically, the latest measurements of height and
weight.
2.  When the POST request is received by the server, the back-end app parses the
request and extracts the relevant information.
3.  The data from the POST request gets added to our records.
4.  As confirmation, a JSON with a unique identifier (so we can refer to this
specific measurement in the future) gets sent to the front end.

Our app can also retrieve records, like so:

1.  Something on the front-end (probably driven by user interaction) triggers a GET
request that asks for a specific record.
2.  When the GET request is received by the server, the back-end app parses the
request and identifies which measurement record is being requested.
3.  The data for the desired measurement gets retrieved from our set of records.
4.  Finally, the desired data gets put into a JSON and sent back to the front end.

If we were to try to generalize and abstract away the differences between these
two steps, we might say that our web application needs to:

-   receive incoming requests from a front-end
-   execute specific behaviors in response to those requests
-   create, read, update, or destroy data records through some kind of data storage
system
-   share information back to the browser

> The quartet of 'create', 'read', 'update', and 'destroy' is commonly known as
> 'CRUD'; each refers to a specific type of action that can be performed on our
> data storage system. Each of these types might have more than one specific
> action associated with it ('read one' vs 'read all', for instance). More on this
> very soon...

One common way of dividing up these four responsibilities is the '**MVC**'
(_Model-View-Control_) architecture pattern. This pattern involves making three
core types of components, each responsible for a different part of the app's
functionality.

A **Model** directly manages the data in our application, and provides a
representation of that data for the rest of the application to use.

A **View** is like it sounds - it's data that gets sent back to the client for
the user to consume.

A **Controller** responds to user requests as they come in, and utilizes both
the model and the view components to perform the desired behavior and produce a
response.

In addition to these three types of components, however, there is a fourth piece
that it's important to consider with web apps in particular - **routing**.
**Routes** indicate to the server which controllers should be triggered (and
how) by which kinds of requests. It's a critical piece of the puzzle, and one
we'll be looking at later today in more detail.

(R)MVC architecture is very common in web applications, and Rails (as we'll soon
see) gives us the tools to spin up applications that are roughly in line with
the idea of (R)MVC.

#### Your Turn :: Act Out an (R)MVC Back-End

We're going to act our the various parts of an (R)MVC application. Link up with
another squad so that you're in a group of roughly seven (in our case nine), and
assign each member of your 'super-group' one of the roles below. These roles are:

-   Client (Instructor)
-   Router
-   Controllers
   -People Controller
   -Places Controller
   -Things Controller
-   Models
   -People Model
   -Places Model
   -Things Model
-  Database

Once you've divvied up the roles, take two minutes to read through the
directions for your role, found `./roles`; these directions explain what your
responsibilities are and how you should carry them out. However, **you may only**
**communicate with the teammates listed in your role card**.

We'll work through one example request together, and then each super-group will
work independently to answer all remaining requests. Once all groups have
finished, we'll have a discussion about how everything went, what made sense,
and what didn't make sense.

## (R)MVC with Rails

**Rails** is a web framework - a tool that helps us quickly and easily build web
applications - written in Ruby, and designed and created by a Danish programmer
named David Heinemeier Hannson (also known as 'DHH'). Although Rails
applications don't match up perfectly with the abstract idea of MVC, their
architecture is fairly similar.

Let's take a look at an actual Rails app and see how it lines up. Fork and clone
[this repo](https://github.com/ga-wdi-boston/rails-tic-tac-toe-api). Recognize
it? It's your Tic Tac Toe back-end from Project 1! Now open it up in Atom - you
should see a file structure like this:

```bash
.
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── Procfile
├── README.md
├── README.rdoc
├── Rakefile
├── app
│   ├── assets
│   │   ├── images
│   │   └── stylesheets
│   │       └── application.css
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── concerns
│   │   ├── games_controller.rb
│   │   ├── open_read_controller.rb
│   │   ├── protected_controller.rb
│   │   └── users_controller.rb
│   ├── helpers
│   │   └── application_helper.rb
│   ├── mailers
│   ├── models
│   │   ├── concerns
│   │   │   ├── authentication.rb
│   │   │   ├── listen_notify.rb
│   │   │   └── tic_tac_toe_validation.rb
│   │   ├── game.rb
│   │   └── user.rb
│   ├── serializers
│   │   ├── game_serializer.rb
│   │   └── user_serializer.rb
│   └── views
│       └── layouts
│           └── application.html.erb
├── bin
│   ├── bundle
│   ├── rails
│   ├── rake
│   └── setup
├── config
│   ├── application.rb
│   ├── boot.rb
│   ├── database.yml
│   ├── environment.rb
│   ├── environments
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers
│   │   ├── backtrace_silencers.rb
│   │   ├── cookies_serializer.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   ├── session_store.rb
│   │   └── wrap_parameters.rb
│   ├── locales
│   │   └── en.yml
│   ├── puma.rb
│   ├── routes.rb
│   └── secrets.yml
├── config.ru
├── db
│   ├── migrate
│   │   ├── 20150602144919_create_users.rb
│   │   └── 20150626193830_create_games.rb
│   ├── schema.rb
│   └── seeds.rb
├── lib
│   ├── assets
│   └── tasks
├── log
├── public
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── favicon.ico
│   └── robots.txt
└── vendor
    └── assets
        ├── scripts
        │   └── resource-watcher-0.1.0.js
        └── stylesheets

```

There are a **ton** of things in here, so let's take a step back and just look
at directories at the top level of the app.

```bash
.
├── app
├── bin
├── config
├── db
├── lib
├── log
├── public
└── vendor
```

-   The `app` directory holds the code for our application itself. We'll be writing
a lot of code here.
-   `bin` holds the binary code for Rails itself, as well as some of the programs
that it depends on - better not touch this directory.
-   `config` holds configuration settings for our app and for the things that plug
into it. This includes things like environmental variable settings and secret
keys, but also things like the routing configuration for our server (which is
not strictly part of our Rails app, but which our app uses); **the `routes.rb`
file, in particular, defines all of the routing for our app.**
-   `db` holds files related to the structure of the application's database. The
database, like the server, is separate from Rails and is not strictly part of
the app, so it makes sense to keep this outside of the `app` directory.

More on this soon.

-   `log` is a place where Rails keeps its log files - records of things that have
happened when the app was running. Looking through here can sometimes be helpful
if you've hit a bug.
-   `public` holds some static HTML pages that anyone can see, regardless of whether
or not they're logged into our app. These are typically pages that represent
different errors our app might have hit, such as `404`.
-   `vendor` holds non-gem software that our app will use. Don't worry too much
about this one for now.

For now, you only need to think about `app`, `config`, and `db` - you probably
won't be touching any code outside of those three directories. How is that
possible? Because Rails actually builds out most of these files and folders for
you, every time you use it to create a new application. That's why it's called a
'framework' - it gives you the skeleton for a brand new app, which you can then
customize.

Let's dive into the `app` directory. This app in particular has more going on
than yours probably will, but it still has all the basic components.

```bash
./app
├── assets
│   ├── images
│   └── stylesheets
│       └── application.css
├── controllers
│   ├── application_controller.rb
│   ├── concerns
│   ├── games_controller.rb
│   ├── open_read_controller.rb
│   ├── protected_controller.rb
│   └── users_controller.rb
├── helpers
│   └── application_helper.rb
├── mailers
├── models
│   ├── concerns
│   │   ├── authentication.rb
│   │   ├── listen_notify.rb
│   │   └── tic_tac_toe_validation.rb
│   ├── game.rb
│   └── user.rb
├── serializers
│   ├── game_serializer.rb
│   └── user_serializer.rb
└── views
    └── layouts
        └── application.html.erb
```
Three of these directories should jump out at you: `controllers`, `models`, and
`views`. Each holds the different Ruby files that Rails uses to handle the
respective responsibilities of MVC.

Don't worry about `assets`, `serializers`, `mailers`, or `helpers` for now.

# Rails API Demo

This is intended for developers to follow along as I build a library API. You
may follow along as I code but I will not slow down or share this code. Later
in this training we will have a code along.

## Preparation

1.  Install dependencies with `bundle install`
1.  Once dependencies have finished installing open your rails server in another
terminal tab with `rails server`.

## Status Check

These will be frequent. As developers we want to be meticulous and make sure
we're getting errors where expected as we build our API.

-  Navigate to `localhost:3000` in chrome.
  - We should get an internal server error in our browser.
  - We should also see some error message in your tab that is running our rails server.
  - __Looks like we're missing secrets. Let's follow the error messages to correct our errors__

## Add Secrets

-  Open `config/secrets.yml`
-  Follow the instructions in that file to set a **different** key for `development` and `test`.
-  *Do not touch `production`*
-  Now that we have our secrets run `rake db:nuke_pave`.
  - This rake command `nuke_pave` is one of many, this one deletes all database
    instances, creates a new one, and loads starting data (if any).
-  Quit your server and restart it.
-  *Did that not work? Are you running a database like postgres?*

## Status Check

-  Navigate to `localhost:3000` in chrome.
  -  Do you get a `welcome aboard` page?
  -  Check your server, are there any error messages?


## Routing

We're making a library API Right? Let's try checking to see if there are any
books by navigating to `localhost:3000/books`

You should get an error similar to the following:

```bash
Routing Error
No route matches [GET] "/books"
```

Whoops! We haven't made any routes yet!

As you learned in the previous lesson,
a route indicates which controller action will be triggered
when a particular type of HTTP request arrives at a given URL.

In order for our API to respond to GET requests at the `/books` URL,
we'll need to create a Route that specifies what to do
when that type of request comes in.

Add the following code to `config/routes.rb`:

```ruby
get '/books', to: 'books#index'
```

This tells Rails,
"When you receive a GET request at the URL path `/books`,
invoke the `index` method specified in the BooksController class."

## Status Check

We changed a small bit of code, let's see if anything has changed.

-  Navigate to `localhost:3000` in chrome.
-  It looks like our error has changed to:
   ```ruby
    >> uninitialized constant BooksController
    ```

## Controller

We haven't _defined_ a BooksController class yet,
so if we try to access `localhost:3000/books`, we'll get another error:

The purpose of a controller is to handle requests of some particular type.
In this case, we want to create a new controller called `BooksController`
for responding to requests about a resource called 'Books'.

Rails has a number of generator tools
for creating boilerplate files very quickly.
To spin up a new controller,
we can just run `rails g controller books --skip-template-engine`.

This will automatically create a new file in `app/controllers`
called `books_controller.rb`, with the following content:

```ruby
class BooksController < ApplicationController
end
```

Not all controllers handle CRUD,
but those that do tend to follow the following convention for their routes
and controller actions:

| Action  | What It Does                             | HTTP Verb | URL           |
|:-------:|:----------------------------------------:|:---------:|:-------------:|
| index   | Return a list of all resource instances. | GET       | `/books`     |
| create  | Create a new instance of a resource.     | POST      | `/books`     |
| show    | Return a single instance of a resource.  | GET       | `/books/:id` |
| update  | Update a single instance of a resource.  | PATCH     | `/books/:id` |
| destroy | Destroy a single instance of a resource. | DELETE    | `/books/:id` |

Let's add an `index` method to `BooksController`.

```ruby
class BooksController < ApplicationController
  def index
    @books = Book.all

    render json: @books
  end
end
```

## Status Check

Let's navigate to `localhost:3000/books` and see if our error has changed.

Let's check out server and see if our error message has changed.

It seems we have an `uninitialized constant`! This is because we have yet to
tell rails what a `book` is, it doesn't know how to **model** the data.

## Model

Let's generate a model by entering `rails g model Book title:string author:string`

-  The g stands for generate, Rails does a lot of work for us.
-  Let's look at what was generated.

## Status Check

Let's navigate to `localhost:3000/books` and see if our error has changed.

Let's check out server and see if our error message has changed.

It seems we have to migrate, let's do that.

## Migrations

Run `rake db:migrate` in the root of this books directory.

Let's navigate to `localhost:3000/books` and see if our error has changed.

We can see what appears to be JSON, but there are no books! That's because we
have not added any.

## Active Record

First let's enter our `rails console` so we can make use of our models. This
lets us interact with Rails from the command line.

We're going to create a single book:

### CRUD: C

```ruby
book1 = Book.create([{ title: 'Less Funny Than Jason', author: 'Lauren Fazah'}])
```

and maybe one more...

```ruby
book2 = Book.create([{ title: 'How I Miss Meat!', author: 'Lauren Fazah'}])
```

We'll be nice to Lauren and add just one extra book:

```ruby
book3 = Book.create([{ title: 'Lauren is on fleek', author: 'Jason Weeks'}])
```

We can even use other methods such as `.new` and `.save`.

Now navigate to `localhost:3000/books` and see if anything has changed.

### CRUD: R

If want to use Active Record for seeing what is in our data store we can do so
by looking for a speific field.

```ruby
Book.find_by(author: 'Lauren Fazah')
# returns the first author

Book.where(author: 'Lauren Fazah')
# returns all results where author == 'Lauren Fazah'

Book.last
# returns the last book in the collection
```

Now navigate to `localhost:3000/books` and see if anything has changed.

There are more ways to read and organize the data using Active Record. I would
encourge you to look up more in your off time.

### CRUD: U

Let's update one of our books using Active record

```ruby
book = Book.find_by(title: 'Less Funny Than Jason')
book.update(title: 'Less overall cool factor than Jason: The Sequel')

# You could also string this together
Book.find_by(title: 'Less overall cool factor than Jason: The Sequel').update(title: 'JASON IS AWESOME THE TRILOGY')
```

Now navigate to `localhost:3000/books` and see if anything has changed.

### CRUD: D

Finally, if we want to remove a book with Active Record we simply do:

```ruby
Book.find_by(author: 'Jason Weeks').destroy
```

Now navigate to `localhost:3000/books` and see if anything has changed.

### What about Curl and Ajax

If we wanted to use Ajax or curl to `create`, `read`, `update` or `destroy` we
will need repeat the process that we used for index.

*Index is one of the (usually) two controller actions that make up `READ` you*
*will need another controller action if you want top show just one item*

### Routing the Rest of CRUD

Remeber how when we first tried to display our JSON on `localhost:3000` we had
to create a route in `config/routes.rb`?

-  This is what in turn triggered the proper controller and controller action.
-  Which in turn interacted with the model
-  Which in turn interacted with the database
-  This cycle then sends information back the way which it came (in this case).

We already did the inital hard work of creating our Books Controller and our
Book Model. We tok care of the database too, so all we have left to do is:

1.   Add proper routes which trigger the correct controller/controller action
1.   Add the corresponding controller action

Open `config/routes.rb` and add the following routes below the index route:

```ruby
post '/books', to: 'books#create'
# POST request from /books send to the books controller, use the create action
get '/books/:id', to: 'books#show'
# GET request from /books send to the books controller, use the show action
patch '/books/:id', to: 'books#update'
delete '/books/:id', to: 'books#destroy'

# Note you may see a PUT request out there in the world, for now ignore it.
```

If you run `rake routes` in the root of this directory you can see a list of
all your current routes. *A useful debugger tool*

`:id` is a dynamic segment, it tells rails to expect a piece of information
which goes inside of a *params hash* which will be accessible in the controller.

*Remember how I said Rails does a lot for us*

It's crucial that we use and `:id` dynamic segment otherwise when we make our
show, patch, and delete requests Rails won't know which item in the data store
you're referring to.

Developers often find shortcuts for things they have to do repeatedly. A
shorthand way of writing all the routes listed above is:

```ruby
resources :books, only: [:index, :show, :create, :update, :destroy]
# I'm a fan of explicit inclusion, but this could also be written:
resources :books, except: [:new, :edit]
```

We have our routes, now it's time to create the controlled actions that
correspond to those routes.

### Controller CRUD

We can already get a list of all of our books, but lets write the controller
action that returns a single book. Add this below your index action:

```ruby
def show
  render json: Book.find(params[:id])
end
```

Test it out by going to `localhost:3000/books/1`. Did you see a book?

Before we go further we should refactor our controller a bit to make it more
secure and DRY.

1. First We're going to set a `before_action` right below where we open up the
`BooksController` Class with this:

```ruby
before_action :set_book, only: [:show, :update, :destroy]
```

This will call the `set_book` method before the `show`, `update`, and `destroy`
actions

Now we have to create the `set_book` method which will just define the instance
variable `@book` as the book that corresponds to the dynamic id you passed in,
in the route:

```ruby
def set_book
  @book = Book.find(params[:id])
end
```

2. Next we want to create a method that will only allow / permit certain keys
(from the key/value pairs being passed in from `create` and `update` requests).

```ruby
def book_params
  params.require(:book).permit(:title, :author)
end
```

This requires a root key of `book` and will permit the client to send a title
and author as well. *We could also require title/author if desired*

Now that we are secure and we can set a single book, we need to finish our CRUD
actions with `create`, `update` and `delete`

For `create` let's add:

```ruby
def create
  @book = Book.new(book_params)

  if @book.save
    render json: @book, status: :created, location: @book
  else
    render json: @book.errors, status: :unprocessable_entity
  end
end
```

For `update` let's add:

```ruby
def update
  if @book.update(book_params)
    head :no_content
  else
    render json: @book.errors, status: :unprocessable_entity
  end
end
```

For `destroy` let's add:

```ruby
def destroy
  @book.destroy

  head :no_content
end
```

One last thing, our helper methods, like `set_book` and security methods like
`book_params` shouldn't be public or able to be accessed in any way, so we're
going to make them private by adding this line right before the final `end` that
closes our `books_controller`:

```ruby
private :set_book, :book_params
```

### Status Check

Test your API by writing the curl request to `create`, `update` and `destroy` a
book.

`create`

```bash
curl --include --request POST http://localhost:3000/books \
  --header "Content-Type: application/json" \
  --data '{
    "book": {
      "title": "Example Title",
      "author": "Example Author"
    }
  }'
```

`show`
```bash
curl --include --request GET http://localhost:3000/books
```

From these is should not be too difficult to construct an `update` and `destroy`
request.

### A Note on Best Practices

While it is important that you understand how to write a controller and what
each part does as mentioned earlier Rails does a fair amount of work for us.

There is a command that will *generate the model, controller and routes for us.*
It will also create all of the standard crude actions which we wrote by hand.
This command is `rails g scaffold` to create exactly what we wrote you would
type `rails g scaffold book title:string author:string`

Different developers have different opinions on using scaffolding, some think
it's lazy and would rather be sure about everything they are putting into their
code.  Others think it's the ultimate tool for productivity and prevent bugs,
errors and typos.

*I would recommend using scaffolding.*

### Migrations

What if we've gotten this far and realized that not only do books have an
`author` and `title`, but we also want to store some `secret_info`? We don't
have to start from scratch, we just have to change out model and tell it to
update the date store accordingly.  We do this with something called a `migration`.

To add another coloumn to our Book model called `secret_info`in the root of this
directory all you would have to type is:

```bash
rails g migration AddSecretInfoToBook secret_info:string
```

The previous command created a migration, which tells the model how to update
the data store.

The following command tells the model to use the migration create and updates
the data session_store

```bash
rake db:migrate
```

Check `localhost:3000/books`, did anything change?

### Serializers

Let's say that secret info was something that was useful for us, like a password
or SSN or something valuable. We don't want to let anyone who makes a `GET`
request to see that valuable info. That's what serializers are for.

It's easy to think of them as JSON formatters. They control what information can
is sent to the client.

Generate a serializer with `rails g serializer book`

Check `localhost:3000/books`, did anything change?

Let's add some attributes that we want to allow the client to see in
`serializers/book_serializer.rb`

```ruby
attributes :id, :author, :title
```

### Congrats

You just created your first API.

## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
