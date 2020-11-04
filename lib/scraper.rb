require 'dotenv/load'

require 'HTTParty'
require 'Nokogiri'
require_relative('./text')



class Scraper
  def initialize
    doc = HTTParty.get(ENV['URL'])
    @parse_page ||= Nokogiri::HTML(doc)
  end

  def get_text
    @status = @parse_page.css("div.table-order-body-list.fourth").to_s.match(/(?<=r">)(.*)(?=<)/).to_s
  end

  def processing_check
    if processing?
      puts "Still processing"

    else
      puts "CHANGE DETECTED"
      Texter.message
      exit
    end
  end

  private
  def processing?
    "Your order is being processed" == @status.strip
  end
end
