require 'open-uri'
require 'nokogiri'

class Scraper
  

  def self.getTableData
    download = open("http://www.health.ny.gov/statistics/cancer/registry/appendix/neighborhoods.htm")

    html = Nokogiri::HTML(download)
    tables = html.search("table")
    table = tables[0]
    nzips = {}
    table.search('tr').each do |tdd|
      nzips[tdd] = {} 
      tdd.search('td').each do |td|
        nzips[tdd][td.text] = td.text
      end
    end
    return nzips
  end

end

# References
# 
# http://talks.thomaslevine.com/news-hack-day-sf/#cheatsheet
# https://scraperwiki.com/scrapers/unionreports/edit/
# https://scraperwiki.com/docs/ruby/
# https://scraperwiki.com/docs/ruby/tutorials/