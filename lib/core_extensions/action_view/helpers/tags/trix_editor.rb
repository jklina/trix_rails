module ActionView
  module Helpers
    module Tags
      class TrixEditor < Base
        delegate :dom_id, to: ActionView::RecordIdentifier

        def render
          options = @options.stringify_keys
          add_default_name_and_id(options)
          options['input'] ||= generate_trix_unique_id
          name = options.delete('name')
          value = value_before_type_cast(object)
          options.symbolize_keys!

          attributes = { class: "formatted_content #{options[:class]}".squish }
          attributes[:autofocus] = true if options[:autofocus]
          attributes[:placeholder] = options[:placeholder]
          attributes[:input] = options.fetch(:input) { "trix_input" }

          editor_tag = content_tag('trix-editor', '', attributes)
          input_tag = hidden_field_tag(name, value, id: attributes[:input])

          editor_tag + input_tag
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
