require 'test_helper'

class TrixEditorTest < ActionView::TestCase
  tests ActionView::Helpers

  test "can instantiate new trix editor helper" do
    post = Post.new
    form = form_for post do |f|
      f.trix_editor :body
      f.trix_editor :summary
    end

    assert_equal form, '<form class="new_post" id="new_post" action="/posts" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><trix-editor class="formatted_content" input="post_summary_trix_input"></trix-editor><input type="hidden" name="post[summary]" id="post_summary_trix_input" /></form>'
  end
end
