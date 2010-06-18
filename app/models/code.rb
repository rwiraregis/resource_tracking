class Code < ActiveRecord::Base
  attr_accessible :long_display, :short_display, :description, :start_date, :end_date
  
  acts_as_nested_set

  has_many :next_level_children, :through => :children, :source => :children, :conditions => "type != '#{self.type}'"
  def to_label 
    short_display
  end

  def to_s
    short_display
  end
  
  #will implement changing codes later after first release
  has_many :proxy_for, :class_name => "Code", :foreign_key => "replacement_code_id"
  belongs_to :replacement_code, :class_name => "Code"
end
