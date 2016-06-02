class Comment
  attr_reader :text, :author, :age

  def initialize(text, author, age)
    @text = text
    @author = author
    @age = age
  end
end
