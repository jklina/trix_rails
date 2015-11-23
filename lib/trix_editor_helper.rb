module TrixEditorHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper
  class Engine < ::Rails::Engine
    isolate_namespace Blorgh
  end

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
require 'core_extensions/action_view/helpers/tags/trix_editor'
