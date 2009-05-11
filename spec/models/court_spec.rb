require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Court do
  before(:each) do
    @valid_attributes = {
      :number => 1,
      :district => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Court.create!(@valid_attributes)
  end
  
  it "should create a #query_string_url" do
    Court.query_string_url(3).should == "http://appellatecases.courtinfo.ca.gov/search/searchResults.cfm?dist=3&search=number"
    Court.query_string_url(4,2).should == "http://appellatecases.courtinfo.ca.gov/search/searchResults.cfm?dist=42&search=number"
  end

  it "should #locate a url for a docket number, court, and district" do
    Court.locate('E045671',4,2).should == "http://appellatecases.courtinfo.ca.gov/search/case/mainCaseScreen.cfm?dist=42&doc_id=1367456&doc_no=E045671"
  end
  
end
