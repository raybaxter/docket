require 'nokogiri'
require 'open-uri'
class Page < ActiveRecord::Base
  belongs_to :case
  before_create :get_filing_date
  
  
  def get_filing_date
    p url
    begin
      doc = Nokogiri::HTML(open(url))
    rescue 
      return self.filing_date = nil
    end
    p "done #{url}"
    self.filing_date = doc.xpath('//tr').select{|r| r.content =~ /Filing Date:/}.last.content.gsub!(/Filing Date:/,'').strip
  end
end
