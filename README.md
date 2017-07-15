# Gibier

A slide tool inspired [Rabbit](https://rabbit-shocker.org/en/usage/rabbit-slide.html)

This is a simple slideshow app using [Hyalite](https://github.com/youchan/hyalite).
Its purpose are one of examples for Hyalite and also intend to be used as pratical presentation tool.

## Installation

    $ gem install gibier

## Setup slideshow

Create new slide app project.

    $ gibier new slide-app

Bundle install.

    $ cd slide-app
    $ bundle install

Run

    $ bundle exec rackup

Open http://localhost:8080/sample then you can see the sample slide.

## Editing

* `data/sample/slide.md` : Markdown file describe the presentation.
* `data/sample/css/custom.css` : Custom CSS file.

Rename directory name `sample` to suit your convenience.
