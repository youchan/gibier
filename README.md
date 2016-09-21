# Hyaslide

Hyaslide is a simple slideshow app using [Hyalite](https://github.com/youchan/hyalite).
This has the purpose as one of examples for Hyalite and also intend to be used as pratical presentation tool.

## Installation

    $ gem install hyaslide

## Setup slideshow

Create new slide app project.

    $ hyaslide new slide-app

Bundle install.

    $ cd slide-app
    $ bundle install

Run

    $ bundle exec rackup

Open http://localhost:8080 then you can see the sample slide.

## Editing

* `data/slide.md` : Markdown file describe the presentation.
* `data/css/custom.css` : Custom CSS file.
