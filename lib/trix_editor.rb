module TrixEditor
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper

  def trix_editor_tag(name, value = nil, options = {})
    options.symbolize_keys!

    attributes = { class: "formatted_content #{options[:class]}".squish }

    attributes[:autofocus] = true if options[:autofocus]
    attributes[:placeholder] = options[:placeholder]
    attributes[:input] = options.fetch(:input) { "trix_input" }

    editor_tag = content_tag('trix-editor', '', attributes)
    input_tag = hidden_field_tag(name, value, id: attributes[:input])

    editor_tag + input_tag
  end
end
# module ActionView
#   module Helpers
#     include TrixEditorHelper
#
#     module Tags
#       class TrixEditor < Base
#         include TrixEditorHelper
#         delegate :dom_id, to: ActionView::RecordIdentifier
#
#         def render
#           options = @options.stringify_keys
#           add_default_name_and_id(options)
#           options['input'] ||=
#             dom_id(object, [options['id'], :trix_input].compact.join('_'))
#           trix_editor_tag(options.delete('name'), value_before_type_cast(object), options)
#         end
#       end
#     end
#
#     module FormHelper
#       def trix_editor(object_name, method, options = {})
#         Tags::TrixEditor.new(object_name, method, self, options).render
#       end
#     end
#
#     class FormBuilder
#       def trix_editor(method, options = {})
#         @template.trix_editor(@object_name, method, objectify_options(options))
#       end
#     end
#   end
# end
