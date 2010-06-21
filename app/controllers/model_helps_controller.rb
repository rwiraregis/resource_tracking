class ModelHelpsController < ApplicationController
  @@shown_columns = [:model_name, :short,  :long]
  @@create_columns = @@shown_columns
  
  active_scaffold :model_help do |config|
    config.columns =  @@shown_columns
    list.sorting = {:model_name => 'DESC'}
    config.nested.add_link("Field Help", [:field_help])
    
    config.create.columns = @@create_columns
    config.update.columns = [:short, :long]
  end
  
end