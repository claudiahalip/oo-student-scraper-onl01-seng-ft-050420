require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    url = "https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"
    
    
    file = Nokogiri::HTML(open(url))
    
    info  = file.css(".student-cards")
    
    students_arr = []    #{:name=>"Mathieu Balez", :location=>"New York, NY", :profile_url=>"students/mathieu-balez.html"}
    
    info.each do |s|
      students_arr << { :name => card.css("h4.student-name").text,
        :location => card.css("p.student-location").text,
        :profile_url => card.css("a").attribute("href").value
      }
    
    binding.pry 
    
    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

