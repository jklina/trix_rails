require 'test_helper'

class TrixEditorTest < ActiveSupport::TestCase
  include TrixEditor
  test "#text_editor_tag returns proper trix tag" do
    html = trix_editor_tag(:test)
    assert_match html, '<trix-editor class="formatted_content" input="trix_input"></trix-editor><input type="hidden" name="test" id="trix_input" />'
  end

  test "#text_editor_tag properly handles values" do
    html = trix_editor_tag(:test, "my value")
    assert_match html, '<trix-editor class="formatted_content" input="trix_input"></trix-editor><input type="hidden" name="test" id="trix_input" value="my value" />'

  end
end
