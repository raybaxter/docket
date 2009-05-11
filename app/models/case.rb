class Case < ActiveRecord::Base
  has_one :page
  default_scope :include=>:pages

  before_create :get_url, :create_page, :get_filing_date
  validates_uniqueness_of :number, :on => :create, :message => "must be unique"
  
  default_scope :include=>:page
  
  def self.import_file(filename="dockets.txt")
    File.open(filename) do |file|
      while line = file.gets 
        self.import_line line
      end 
    end
  end
  
  def self.import_line(string)
    docket, c, d = string.split(/;/)
    record = create!(:number => docket, :court => c, :district => d)
    record
  end
  
  def get_url
    self.url = Court.locate(number,court,district)
  end
  
  def create_page
    self.page = Page.create!(:url => url)
  end
  
  def get_filing_date
    self.filing_date = page.filing_date
  end
end
