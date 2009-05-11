class CaseController < ApplicationController

  active_scaffold :case do |config|
    config.label = "Cases"
    config.columns = [:number, :url, :filing_date, :court, :district]
    create.columns.exclude :url
    list.columns.exclude :url
    list.sorting = {:filing_date => 'ASC'}
    list.per_page = 100
  end

end
