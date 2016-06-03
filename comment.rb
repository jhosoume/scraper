class Comment
  attr_reader :text, :author, :age

  def initialize(text, author, age)
    @text = text.strip
    @author = author
    @age = age
  end

  def to_s
    "Comment made by #{author}, #{age}
    Comment text: #{text}"
  end
end
