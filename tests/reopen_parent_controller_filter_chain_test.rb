require File.join(File.dirname(__FILE__), 'test_helper')

class ReopenParentControllerFilterChainTest < Test::Unit::TestCase
  # build our test classes
  class ApplicationController < ::ActionController::Base
    before_filter :application_filter
    def application_filter; puts "something"; end
  end

  class ChildController < ApplicationController
    before_filter :child_filter
    def child_filter; puts "from the mouths of babes";end
  end

  # now we reload
  ApplicationController.class_eval do
    before_filter :new_stuff_baby
    def new_stuff_baby; puts "yeah!"; end
  end

  ::ActionController::Base.build_filter_chain

  def app_filter_chain
    ApplicationController.filter_chain
  end

  def child_filter_chain
    ChildController.filter_chain
  end

  context "The ApplicationController" do

    should "have a two filters" do
      assert_equal 2, app_filter_chain.size
    end

    should "have a filter named :new_stuff_baby" do
      assert_contains_filter app_filter_chain, :new_stuff_baby
    end

  end

  context "The ChildController" do

    should "have a three filters" do
      assert_equal 3, child_filter_chain.size
    end

    should "have a filter named :new_stuff_baby" do
      assert_contains_filter child_filter_chain, :new_stuff_baby
    end

  end

end
