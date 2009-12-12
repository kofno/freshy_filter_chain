require 'action_controller'
require 'action_controller/filters'

module ActionController

  module Filters
    FilterChain.class_eval do

      def update_filter_chain_with_out(filters, filter_type, pos, &block)
        update_filter_chain_without_out(filters, filter_type, pos, &block)
      end
      alias_method_chain :update_filter_chain, :out

    end
  end

  class Base
    class << self
      def deferred_filters
        @deferred_filters ||= []
      end

      def before_filter_with_out(*filters, &block)
        deferred_filters << {:filters => filters, :block => block, :type => :before}
        #before_filter_without_out(*filters, &block)
      end
      alias_method_chain :before_filter, :out

      def build_filter_chain
        deferred_filters.each do |filter|
          if filter[:type] == :before
            before_filter_without_out(*filter[:filters], &filter[:block])
          end
        end
        filter_chain = read_inheritable_attribute('filter_chain')
        immediate_subclasses.each do |child|
          child.write_inheritable_attribute('filter_chain', filter_chain ? filter_chain.dup : Filters::FilterChain.new)
          child.build_filter_chain
        end
      end

      def immediate_subclasses
        @immediate_subclasses ||= []
      end

      def inherited_with_subclass_recording(child)
        immediate_subclasses << child
        inherited_without_subclass_recording(child)
      end
      alias_method_chain :inherited, :subclass_recording
    end
  end

end

