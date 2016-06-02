class User

  def initialize
    @url = get_url
    @scraper = Scraper.new(@url)
    @post = @scraper.create_post 

    expose
  end

  def get_url
    if ARGV.empty?
      puts "Expects to receive an actual URL."
      exit!
    else
      ARGV[0]
  end

end

User.new if $0 == __FILE__