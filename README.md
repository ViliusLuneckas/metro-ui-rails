# Metro UI for Rails 3.1 Asset Pipeline

This gem integrates [Metro-UI-CSS](https://github.com/olton/Metro-UI-CSS) toolkit into Rails 3.1 Asset Pipeline.

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/ViliusLuneckas/metro-ui-rails)

## Installation

Add these lines to your application's Gemfile:
    
    gem 'therubyracer'
    gem 'metro-ui-rails'

And then execute in command line:

    $ bundle

## Installing to Rails project:

Run rails generator:

    rails generate metro:install
    
### Or install it manually

Require metro-ui/metro.less in your application.less:

    @import 'metro-ui/modern.less';
    @import 'metro-ui/modern-responsive.less'; // for responsive design

And then require metro-ui in your js or coffee application file:

    #= require metro-ui


## Layout generator

You can generate Metro UI compatible .erb layout.

Usage:
    
    rails generate metro:layout [LAYOUT_NAME]

Example:

    rails generate metro:layout application

## License

This project only integrates [Metro-UI-CSS](https://github.com/olton/Metro-UI-CSS), 
thus all credits go to Sergey Pimenov, see his [license](https://github.com/olton/Metro-UI-CSS).
