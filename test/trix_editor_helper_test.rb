require 'test_helper'

class TrixEditorHelperTest < ActiveSupport::TestCase
  include TrixEditorHelper

  test "#text_editor_tag returns proper trix tag" do
    html = trix_editor_tag(:test)
    assert_equal html, '<trix-editor class="formatted_content" input="trix_input"></trix-editor><input type="hidden" name="test" id="trix_input" />'
  end

  test "#text_editor_tag properly handles values" do
    html = trix_editor_tag(:test, "my value")
    assert_equal html, '<trix-editor class="formatted_content" input="trix_input"></trix-editor><input type="hidden" name="test" id="trix_input" value="my value" />'

  end

  test "#text_editor_tag takes placeholder attribute" do
    html = trix_editor_tag(:test, nil, placeholder: "my text")
    assert_equal html, '<trix-editor class="formatted_content" placeholder="my text" input="trix_input"></trix-editor><input type="hidden" name="test" id="trix_input" />'
  end

  test "#text_editor_tag takes input attribute" do
    html = trix_editor_tag(:test, nil, input: "my-input")
    assert_equal html, '<trix-editor class="formatted_content" input="my-input"></trix-editor><input type="hidden" name="test" id="my-input" />'
  end
end
