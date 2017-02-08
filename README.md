# re:Action

_This project is under active development, more documentation and info coming soon._

## Installing

Ensure you have Postgres installed. An easy solution is [Postgres.app](http://postgresapp.com/), or with homebrew: `brew intall postgres`, and following the directions after install.

Clone this repository:

    git clone https://github.com/reaction-project/reaction-project

To install application dependencies and set up the database, cd into the project directory and run the setup script:

    cd reaction-project
    ./bin/setup

This will add a `.env` file to the project root, which is where environment variables for your local environment are stored. You may open and customize these if you wish.

Start the server:

    heroku local

You can now visit the site locally at http://lvh.me:5000.

---

To run the test suite, simply issue: `rails spec`.

