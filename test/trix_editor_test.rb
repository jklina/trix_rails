require 'test_helper'

class TrixEditorTest < ActiveSupport::TestCase
  include TrixEditor
  test "#text_editor_tag returns proper trix html" do
    html = trix_editor_tag(:test)
    assert_match html, '<trix-editor class="formatted_content" input="trix_input_1"></trix-editor><input type="hidden" name="test" id="trix_input_1" />'
  end
end
