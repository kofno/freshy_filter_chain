require 'action_controller'

module ActionController

  class Base
    class << self
      def self.record_filter_chain_ops_for(*filter_methods)
        filter_methods.each do |meth|
          class_eval <<-CODE
            def #{meth}_with_recording(*filters, &block)
              filter_operation = lambda { #{meth}_without_recording(*filters, &block) }
              filter_operation.call
              recorded_filter_chain_ops << filter_operation
              refresh_subclass_filter_chains
            end
            alias_method_chain meth, :recording
          CODE
        end
      end
      record_filter_chain_ops_for :append_before_filter, :before_filter
      record_filter_chain_ops_for :append_after_filter,  :after_filter
      record_filter_chain_ops_for :append_around_filter, :around_filter
      record_filter_chain_ops_for :prepend_before_filter, :prepend_after_filter, :prepend_around_filter
      record_filter_chain_ops_for :skip_before_filter, :skip_after_filter, :skip_filter

      def refresh_subclass_filter_chains
        immediate_subclasses.each do |child|
          child.write_inheritable_attribute('filter_chain', filter_chain.dup)
          child.replay_filter_chain_ops
          child.refresh_subclass_filter_chains
        end
      end

      def replay_filter_chain_ops
        recorded_filter_chain_ops.each { |filter_chain_op| filter_chain_op.call }
      end

      def immediate_subclasses
        @immediate_subclasses ||= []
      end

      def inherited_with_subclass_recording(child)
        immediate_subclasses << child
        inherited_without_subclass_recording(child)
      end
      alias_method_chain :inherited, :subclass_recording

      def recorded_filter_chain_ops
        @recorded_filter_chain_ops ||= []
      end

    end

  end

end

