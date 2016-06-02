require 'nokogiri'

class Post
  attr_reader :comments, :title, :url, :points, :item_id

  def initialize(url, tile, points, item_id)
    @url = url
    @comments = []
    @title = title
    @points = points
    @item_id = item_id
  end

  def add_comment(comment)
    @comments << comment
  end

  def num_comments
    @comments.length
  end

end

