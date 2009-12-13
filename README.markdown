# Freshy Filter Chains: Get yourself a freshy!

Freshy gives your ActionController filter chains more consistent inheritence behavior, regardless of the order the code is loaded.

## Install

As a plugin:

    ./script/plugin instal git://github.com/kofno/freshy_filter_chain.git

As a gem:

    gem install freshy_filter_chain

And don't forget to add the gem to your rails config

    config.gem "freshy_filter_chain"

## Links

* [Wiki](http://wiki.github.com/kofno/freshy_filter_chain)
* [Issues](http://github.com/kofno/freshy_filter_chain/issues)

## Why would I need this?

You may not. In general, the Rails community tends to treat plugins a extensions to Rails, and application code builds on Rails and the plugins. For this scenario, the default filter chain inheritence is fine.

Of course, the other use of plugins is to extend the application's functionality. When writing an extension, its quite common to re-open the application controller and update the filters. In this scenario, depending on how the code loads, extension filters may not be inherited by subclasses. This is exactly the scenario freshy was created to fix.

[More information on inheritable attributes and filter chains](http://wiki.github.com/kofno/freshy_filter_chain/rails-inheritable-attributes)




