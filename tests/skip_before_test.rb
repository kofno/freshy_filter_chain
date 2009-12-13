require File.join(File.dirname(__FILE__), 'test_helper')

class SkipBeforeTest < Test::Unit::TestCase

  class ApplicationController < ::ActionController::Base
    before_filter :application_filter
  end

  class ChildController < ApplicationController
    before_filter :child_filter
    skip_before_filter :after_thought
  end

  ApplicationController.class_eval do
    before_filter :after_thought
  end

  context "The ApplicationController" do
    setup do
      @app_filter_chain = ApplicationController.filter_chain
    end

    should "have only its own filters" do
      assert_contains_filter @app_filter_chain, :application_filter
      assert_contains_filter @app_filter_chain, :after_thought
      assert_equal 2, @app_filter_chain.size
    end

  end

  context "The ChildController" do
    setup do
      @child_filter_chain = ChildController.filter_chain
    end

    should "should have its own filter, plus the inherited ones" do
      assert_contains_filter @child_filter_chain, :application_filter
      assert_filter_absent   @child_filter_chain, :after_thought
      assert_contains_filter @child_filter_chain, :child_filter
      assert_equal 2, @child_filter_chain.size
    end
  end
end
