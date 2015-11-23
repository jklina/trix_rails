require 'test_helper'

class TrixEditorTest < ActionView::TestCase
  tests ActionView::Helpers

  test "#text_editor_tag returns proper trix tag" do
    post = Post.new
    form = form_for post do |f|
      f.trix_editor :body
    end

    assert_equal '<form class="new_post" id="new_post" action="/posts" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><trix-editor class="formatted_content" input="post_body_trix_input"></trix-editor><input type="hidden" name="post[body]" id="post_body_trix_input" /></form>', form
  end

  test "#text_editor_tag properly handles values" do
    post = Post.new(body: "my value")

    form = form_for post do |f|
      f.trix_editor :body
    end

    assert_equal '<form class="new_post" id="new_post" action="/posts" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><trix-editor class="formatted_content" input="post_body_trix_input"></trix-editor><input type="hidden" name="post[body]" id="post_body_trix_input" value="my value" /></form>', form
  end

  test "#text_editor_tag takes placeholder attribute" do
    post = Post.new

    form = form_for post do |f|
      f.trix_editor :body, placeholder: 'my placeholder'
    end

    assert_equal '<form class="new_post" id="new_post" action="/posts" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><trix-editor class="formatted_content" placeholder="my placeholder" input="post_body_trix_input"></trix-editor><input type="hidden" name="post[body]" id="post_body_trix_input" /></form>', form
  end

  test "#text_editor_tag takes input attribute" do
    post = Post.new

    form = form_for post do |f|
      f.trix_editor :body, input: 'my-input'
    end

    assert_equal '<form class="new_post" id="new_post" action="/posts" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><trix-editor class="formatted_content" input="my-input"></trix-editor><input type="hidden" name="post[body]" id="my-input" /></form>', form
  end

  test "can instantiate new trix editor helper" do
    post = Post.new
    form = form_for post do |f|
      f.trix_editor :body
      f.trix_editor :summary
    end

    assert_equal '<form class="new_post" id="new_post" action="/posts" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><trix-editor class="formatted_content" input="post_summary_trix_input"></trix-editor><input type="hidden" name="post[summary]" id="post_summary_trix_input" /></form>', form
  end
end
