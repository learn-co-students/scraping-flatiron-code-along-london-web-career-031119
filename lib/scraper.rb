require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    url = "http://learn-co-curriculum.github.io/site-for-scraping/courses"
    doc = Nokogiri::HTML(open(url))

    # binding.pry
  end

  def get_courses
    get_page.css(".post")
    # .each do |post|
      # course = Course.new
      # course.title = post.css("h2").text
      # course.schedule = post.css(".date").text
      # course.description = post.css("p").text
    # end
  end

  def make_courses
    
    get_courses.each do |course_div|
      course = Course.new
      course.title = course_div.css("h2").text
      course.schedule = course_div.css(".date").text
      course.description = course_div.css("p").text
    end
  end
  
end

Scraper.new.get_page




