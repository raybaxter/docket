require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Case do
  before(:each) do
    @location_url = "http://appellatecases.courtinfo.ca.gov/search/case/mainCaseScreen.cfm?dist=42&doc_id=1367456&doc_no=E045671"
    @valid_attributes = {
      :number => "E045671",
      :url => "",
      :court => "4",
      :district => "2",
      :last_checked => Time.now
    }
    Court.stub!(:locate).and_return(@location_url)
    Page.stub!(:filing_date).and_return("04/18/2008")
  end

  it "should create a new instance given valid attributes" do
    Case.create!(@valid_attributes)
  end
  
  it "should lookup the url before saving" do
    Case.create!(@valid_attributes).url.should == @location_url
  end
  
  it "should import for a comma delimited line" do
    c = Case.import_line("C058849, 3,")
    c.number.should == "C058849"
    c.court.should == 3
    c.district.should be_nil
  end
  
  it "should import for a comma delimited file for district 4" do
    c = Case.import_line("C058849, 4, 1")
    c.court.should == 4
    c.district.should == 1
  end
  
  it "should validate the uniqueness of a docket number" do
    Case.create!(@valid_attributes)
    lambda { Case.create!(@valid_attributes)}.should raise_error
  end
  
  it "should have a #filing_date" do
    c = Case.create!(@valid_attributes)
    c.filing_date.should == Date.parse("04/18/2008")
  end
  
  it "should have_one page" do
    Case.reflect_on_association(:page).should_not be_nil
  end
  
  
  
end
