class StaffMember 
  include ActiveModel::Model
  attr_accessor :start_work_hour__c, :end_work_hour__c, :start_weekend_hour, :end_weekend_hour
  
  def initialize(options = {})
    @start_work_hour__c = options[:start_work_hour__c]
    @end_work_hour__c =  options[:end_work_hour__c]
    @start_weekend_hour = options[:start_weekend_hour]
    @end_weekend_hour = options[:end_weekend_hour]
  end
  
  def events; {} end
  def timezone; Time.find_zone("PST8PDT") end
  def start_hour; self.try(:start_work_hour__c) || '10:00' end
  def end_hour; self.try(:end_work_hour__c)   || '19:00' end
  def start_weekend_hour; self.try(:start_work_hour__c) || '12:00' end
  def end_weekend_hour; self.try(:end_work_hour__c)   || '16:00' end
  def start_hour_offset; ChronicDuration.parse([start_hour, ':00'].join) end
  def end_hour_offset; ChronicDuration.parse([end_hour, ':00'].join) end

  def start_weekend_hour_offset; ChronicDuration.parse([start_weekend_hour, ':00'].join) end
  def end_weekend_hour_offset; ChronicDuration.parse([end_weekend_hour, ':00'].join) end

end