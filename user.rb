#!/usr/bin/env ruby
require 'pry'
require 'byebug'

require_relative 'scraper'
require 'colorize'

class User

  attr_reader :post

  def initialize
    @url = get_url
    @scraper = Scraper.new(@url)
    @post = @scraper.create_post 
    @scraper.parse_comments(post)
    expose
  end

  def get_url
    if ARGV.empty?
      puts "Expects to receive an actual html"
      exit!
    else
      ARGV[0]
    end
  end

  def expose
    print_post
    puts "__________________________"
    print_comments
  end

  def print_post
    puts "Post title: #{post.title}".red
    puts "Number of comments: #{post.num_comments}"
    puts "Post points: #{post.points}".blue
    puts "Post ID: #{post.item_id}"
  end

  def print_comments
    post.comments.each { |comment| puts comment}
  end

end

User.new if $0 == __FILE__