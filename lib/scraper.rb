require 'nokogiri'
require 'open-uri'
require "pry"
# We are requiring our Course class file so that our Scraper can make 
# new courses and give them attributes scraped from the web page.
require_relative './course.rb'

class Scraper
# As soon as  i get the HTML document using Nokogiri, will then drop into pry and play around with CSS selectors 
def get_page #> all the code commented out below this method doent really belong here only the first line 
  doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))  
  # doc.css(".post").each do |post|
  #   course = Course.new
  #   course.title = post.css("h2").text
  #   course.schedule = post.css(".date").text
  #   course.description = post.css("p").text
  # binding.pry
  # end
  end

  def get_courses 
    self.get_page.css(".post") 
  end

  def make_courses
    self.get_courses.each do |post|
        course = Course.new
        course.title = post.css("h2").text
        course.schedule = post.css(".date").text
        course.description = post.css("p").text
    end
  end


end

Scraper.new.get_page # > now i will see the html doc retreived by Nokogiri and open-uri
#  time to ind the CSS selectr that will grab the course offering from the HTML document
# i inspected the element that holds the section for course offerings 
# <article class="post same-height-left" style="height: 489px;">
# now i will use the css class .post to try grab alll the courses 
# So i went onto my terminal and executed the following line :   
# doc.css(".post")
# time to find the CSS Selectors for the Desired attributes . collections of Nokogiri XLM elements
# functions like array. therefore i can iterate over it to grab the 
# title , schedules and description of each one 

# exectued doc.css(".post").first 
# to grab just the first element from the collection 
# it now contains all the info i need, easiest way to id THE CORRECT css SELECTOR is is to revist the
# the webspage and examine it with our insepct elemennt tool 

# Scraping Course Title 
 # hovering over the course title i will see h2 750,428 x 28px 
 # exectue  :
#  doc.css(".post").first.css("h2") > almost hve the course title inside this 
 # Nokogiri:: XML:: Text Element type execute :  
#  doc.css(".post").first.css("h2").text
 # > "Web Development Immersive" 

 # Scraping Course schedule 
  # > go bac to the site and hover on the first course offering "full time or part time " it reads
   # em.date  so now exectue
   # doc.css(".post").first.css(".date").text  > "Full-time " now i have the code for grabbing an individuals courses scheules

# Scraping Course descrption 
  #> hover over the first courses desciptiong should see a tag appear  p 750. blah blah some pixels. select the p tag
  # > doc.css(".post").first.css("p").text   returns the descirption 



# our working code
# The page itself:
# doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
# The collection of course offerings:
# doc.css(".post")
# The title of an individual course offering:
# doc.css(".post").first.css("h2").text
# The schedule of an individual course offering:
# doc.css(".post").first.css(".date").text
# The description of an individual course offering:
# doc.css(".post").first.css("p").text






# def print_courses
#   self.make_courses
#   Course.all.each do |course|
#     if course.title
#       puts "Title: #{course.title}"
#       puts "  Schedule: #{course.schedule}"
#       puts "  Description: #{course.description}"
#     end
#   end
# end

