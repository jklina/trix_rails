require 'active_model'

class Post
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :body, :summary

  def initialize()
  end

  def persisted?
    false
  end
end
