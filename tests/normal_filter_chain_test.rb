require File.join(File.dirname(__FILE__), 'test_helper')

# captures normal, healthy filter_chain behavior
class NormalFilterChainTest < Test::Unit::TestCase

  # build our test classes
  class ApplicationController < ::ActionController::Base
    before_filter :application_filter
    def application_filter; puts "something"; end
  end

  class ChildController < ApplicationController
    before_filter :child_filter
    def child_filter; puts "from the mouths of babes";end
  end

  def app_filter_chain
    ApplicationController.filter_chain
  end

  def child_filter_chain
    ChildController.filter_chain
  end

  context "The ApplicationController" do

    should 'have one filter' do
      assert_equal 1, app_filter_chain.size
    end

    should 'have a filter named :application_filter' do
      assert_contains_filter app_filter_chain, :application_filter
    end
  end

  context "The ChildController" do

    should 'have two filters' do
      assert_equal 2, child_filter_chain.size
    end

    should 'have a filter named :application_filter' do
      assert_contains_filter child_filter_chain, :application_filter
    end

    should 'have a filter named :child_filter' do
      assert_contains_filter child_filter_chain, :child_filter
    end

  end

end
