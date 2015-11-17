Introduction
------------

This documentation was created with [Slate](http://tripit.github.io/slate).

Building the Documentation
--------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal. In OSX, you can use rvm to avoid interfering with the system ruby installation.
 - **NodeJS 0.12 or newer**
 - **json-schema-to-markdown** - Just run `npm install -g json-schema-to-markdown-table`.

### Getting Setup

 1. Clone this repository
 2. `cd ripple-api-docs`
 3. Install all dependencies: `bundle install`
 4. Update JSON schemas (the markdown tables in the documentation are generated from these schemas): `git pull --recurse-submodules && git submodule update --recursive`. This update should be done before every release of the documentation.
 5. Start the test server: `bundle exec middleman server`

You can now see the docs at <http://localhost:4567>.

## Updating JSON Schemas

The markdown tables are automatically generated from the JSON files in the
`ripple-lib` subtree. This git subtree must be updated periodically with the
following command: `git subtree pull --prefix ripple-lib git@github.com:ripple/ripple-lib.git develop --squash`.

## Editing Slate Markdown

[Slate Markdown Syntax](https://github.com/tripit/slate/wiki/Markdown-Syntax)

## Publishing

Be sure to update the JSON schemas with `git pull --recurse-submodules && git submodule update --recursive`, then:
[Publishing Slate Projects](https://github.com/tripit/slate/wiki/Deploying-Slate).

