require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    url = "https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"
    
    
    file = Nokogiri::HTML(open(url))
    
    info  = file.css("div.roster-cards-container")
    
    arr_students = []
    info.each do |r| 
      r.css("div.student-card")
      
    binding.pry 
    
    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

