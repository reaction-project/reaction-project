# re:Action

Re:Action is a collaborative grassroots organization founded on the power individuals have to affect meaningful change. We believe that what stands between action and inaction is not a lack of will, but information and a clear path toward participation. After the recent presidential election, people across the country are searching for ways to make a real difference, for a sense of community, for the opportunity to be a part of something larger than themselves. This is the inspiration for re:Action.

Currently in development, re:Action will take the form of a digital platform empowering people to become active participants in the political issues that are important to them, at whatever their comfort level. Through fact-based content and issue analysis, re:Action will bring together experienced and novice activists in a location-based platform designed to make information sharing easy and engaging while driving direct action.

The platform will be a resource for issue-related events and action opportunities, a source for reliable news and opinion pieces, as well as a place for community engagement. In this way, we will provide a new wave of activists with the knowledge and support necessary to create a brighter, inclusive future for everyone.

To be notified when we launch, please sign up at http://reaction-project.org/.

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

