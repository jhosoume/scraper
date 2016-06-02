class Scraper
  attr_reader :post, :doc
  attr_accessor :url

  def initialize(url)
    self.url = url
    @doc = Nokogiri::HTML(File.open(url))
  end

  def create_post
    title = doc.search("title").text
    points = doc.search(".subtext > span:first-child").text 
    item_id = doc.search('.subtext > span:first-child').map { |span| span["id"]}.first.scan(/\d+/)
    Post.new(url, title, points, item_id)
  end

  def parse_comments(post)
    texts = doc.search('.comment').map { |font| font.inner_text}
    authors = doc.search('.comment-tree .comhead > a:first-child').map { |font| font.inner_text}
    ages = doc.search('.comment-tree .comhead > .age').map { |link| link.inner_text}.length
    zip(texts, authors, ages).each do |comments_attrs|
      post.add_comment(Comment.new(*comments_attrs)) # I don't return because I expect that the post received isn't a copy, but a reference
    end
  end 

end