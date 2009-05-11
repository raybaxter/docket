require 'net/http'
class Court < ActiveRecord::Base
  
  def self.import
    (1..6).each do |n|
      if n == 4 
        (1..3).each do |d|
          create!(:number => n, :district => d)
        end
      else
        create!(:number => n)
      end
    end
  end
  
  def self.locate(docket,number,district=nil)
    url = self.query_string_url(number,district)
    data = "query_caseNumber=#{docket}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host)
    r = http.post(uri.request_uri,data)
    return "http://appellatecases.courtinfo.ca.gov/search/#{r.response['location']}"
    # "case/mainCaseScreen.cfm?dist=42&doc_id=1367456&doc_no=E045671"
    # require 'ruby-debug'; debugger
    # 
    # return "http://appellatecases.courtinfo.ca.gov/search/case/mainCaseScreen.cfm?dist=42&doc_id=1367456&doc_no=E045671"
    # 
  end
  
  
  def self.query_string_url(number,district='')
    "http://appellatecases.courtinfo.ca.gov/search/searchResults.cfm?dist=#{number}#{district}&search=number"
    # User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.10) Gecko/2009042315 Firefox/3.0.10
    # Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
    # Accept-Language: en-us,en;q=0.5
    # Accept-Encoding: gzip,deflate
    # Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
    # Keep-Alive: 300
    # Connection: keep-alive
    # Referer: http://appellatecases.courtinfo.ca.gov/search.cfm?dist=42
    # Content-Type: application/x-www-form-urlencoded
    # Content-Length: 24
    # query_caseNumber=E045671
    # HTTP/1.x 302 Found
    # Date: Mon, 11 May 2009 04:32:19 GMT
    # Server: Web Server
    # Location: case/mainCaseScreen.cfm?dist=42&doc_id=1367456&doc_no=E045671
    # Keep-Alive: timeout=5, max=299
    # Connection: Keep-Alive
    # Transfer-Encoding: chunked
    # Content-Type: text/html; charset=iso-8859-1
    
  end
end
