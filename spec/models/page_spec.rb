require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Page do
  before(:each) do
    @valid_attributes = {
      :url => "http://appellatecases.courtinfo.ca.gov/search/case/mainCaseScreen.cfm?dist=42&doc_id=1367456&doc_no=E045671",
      :md5 => "value for md5"
    }
    
    @page = Page.create!(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    Page.create!(@valid_attributes)
  end
  
  it "should return a filing_date from a page" do
    @page.filing_date.should == Date.parse("04/18/2008")
  end
  
  
  it "should belong to a case" do
    Page.reflect_on_association(:case).should_not be_nil
  end
  
  
  
end
