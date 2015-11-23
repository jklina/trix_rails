require 'active_model'

class Post
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :body, :summary

  def initialize(body: nil, summary: nil)
    self.body = body
    self.summary = summary
  end

  def persisted?
    false
  end
end
