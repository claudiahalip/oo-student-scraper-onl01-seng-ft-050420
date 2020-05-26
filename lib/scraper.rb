require 'open-uri'
require 'pry'

class Scraper
  
  

  def self.scrape_index_page(index_url)
    
    
    
    file = Nokogiri::HTML(open(index_url))
    
    info  = file.css(".student-cards")
    
    students_arr = []    #{:name=>"Mathieu Balez", :location=>"New York, NY", :profile_url=>"students/mathieu-balez.html"}
    
    info.map do |c|
      students_arr << { :name => c.css("h4.student-name").text,
        :location => c.css("p.student-location").text,
        :profile_url => c.css("a").attribute("href").value
      }
    end 
      
    students_arr
    

  end
  
  
  

  def self.scrape_profile_page(profile_url)
    
    html = open(profile_url)
    file = Nokogiri::HTML(html)
    attributes = {}

    file.css("div.social-icon-container a").each do |xml|
      case xml.attribute("href").value

      when /github/
        attributes[:github] = xml.attribute("href").value
      when /linkedin/
        attributes[:linkedin] = xml.attribute("href").value      
      when /twitter/
        attributes[:twitter] = xml.attribute("href").value
      else
        attributes[:blog] = xml.attribute("href").value
      end
    end 
    
    
  end 
    
  

end

