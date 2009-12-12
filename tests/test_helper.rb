require 'rubygems'
require 'test/unit'

# tests are now awesome
gem 'thoughtbot-shoulda'
require 'shoulda'

# pretty colors
gem 'redgreen'
require 'redgreen'

# need some rails bits
gem 'actionpack'
require 'action_controller'

#my bits
require 'deferred_filter_chain'

# some useful assertions

def assert_contains_filter(collection, filter_name)
  if collection.any? {|filter| filter.method == filter_name}
    assert_block { true }
  else
    failure_msg = "#{filter_name.inspect} could not be found in #{collection.inspect}"
    assert_block(failure_msg) { false }
  end
end
