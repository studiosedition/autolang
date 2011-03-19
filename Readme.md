Autolang
========

Goal
====
 - Kick-start your translation!
 - Translate all your Gettext - msgids to another language using google-translate.
 - Provide a simple interface for other translation tasks


Install
=======

gem install autolang

Add to Gemfile
    gem "autolang", :group=>:development

OR as Rails plugin
    rails plugin install git://github.com/grosser/autolang.git

OR copy rake tasks
    curl https://github.com/grosser/autolang/raw/master/lib/tasks/autolang.rake > lib/tasks/autolang.rake

Usage
=====
Translate your pot file to any other language:

    # to translate into spanish (=es), when current apps name is myapp (from myapp.pot)
    L=es POT_FILE=/app/po/my_app.pot rake autolang:translate

Translation examples
====================
 - Car|Engine -> Motor
 - hello %{name} -> hallo %{name}

TODO
====
 - Do not convert "& to "and", use something 'smarter'.

Authors
=======
Original by [Chris Blackburn](cbciweb.com) released under MIT license

Enhanced by

 - [Michael Grosser](http://grosser.it)
 - [Hans Engel](http://engel.uk.to/)
