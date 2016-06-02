def Comment
  attr_reader :text, :author, :age
  def intialize(text, author, age)
    @text = text
    @author = author
    @age = age
  end
end