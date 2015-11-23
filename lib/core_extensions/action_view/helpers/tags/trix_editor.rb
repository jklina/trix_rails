module ActionView
  module Helpers
    module Tags
      class TrixEditor < Base
        #TODO Reference this absolutely
        include TrixEditorHelper
        delegate :dom_id, to: ActionView::RecordIdentifier

        def render
          options = @options.stringify_keys
          add_default_name_and_id(options)
          options['input'] ||= generate_trix_unique_id
          # Delete name so it doesn't get passed in the options hash
          trix_editor_tag(options.delete('name'),
                          value_before_type_cast(object),
                          options)
        end

        private

        def generate_trix_unique_id
          tag_id + "_trix_input"
        end
      end
    end

    # Monkey patch the trix editor helper into Rails' FormBuilder
    module FormHelper
      def trix_editor(object_name, method, options = {})
        Tags::TrixEditor.new(object_name, method, self, options).render
      end
    end

    class FormBuilder
      def trix_editor(method, options = {})
        @template.trix_editor(@object_name, method, objectify_options(options))
      end
    end
  end
end
