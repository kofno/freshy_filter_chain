require File.join(File.dirname(__FILE__), 'test_helper')

class DeepClassHierarchyTest < Test::Unit::TestCase

  class ApplicationController < ::ActionController::Base
    after_filter :application_filter
  end

  class ChildController < ApplicationController
    before_filter :child_filter
    skip_filter :after_thought
  end

  ApplicationController.class_eval do
    around_filter :after_thought
    before_filter { puts "poo" }
  end

  class SubChildController < ChildController
    append_before_filter :sub_filter
    skip_after_filter :application_filter
  end

  ChildController.class_eval do
    append_after_filter :late_arrival
    append_around_filter :gets_around
    prepend_before_filter :line_cutter
  end

  context "The ApplicationController" do
    setup do
      @app_filter_chain = ApplicationController.filter_chain
    end

    should "have only its own filters" do
      assert_chain_order [:after_thought, :a_proc, :application_filter], @app_filter_chain
    end

  end

  context "The ChildController" do
    setup do
      @child_filter_chain = ChildController.filter_chain
    end

    should "should have its own filter, plus the inherited ones" do
      assert_chain_order [:line_cutter, :a_proc, :child_filter, :gets_around, :application_filter, :late_arrival], @child_filter_chain
    end
  end

  context "The SubChildController" do
    setup do
      @sub_child_filter_chain = SubChildController.filter_chain
    end

    should "should have its own filter, plus the inherited ones" do
      assert_chain_order [:line_cutter, :a_proc, :child_filter, :gets_around, :sub_filter, :late_arrival], @sub_child_filter_chain
    end
  end

end
