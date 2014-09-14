class Contract < ActiveRecord::Base
	validates_presence_of :account, :message => "Can't be blank"
	validates_presence_of :customer, :message => "Can't be blank"
	validates_presence_of :title, message: "Can't be blank"
	validates_presence_of :contract_no, message: "Can't be blank"
	validates_uniqueness_of :contract_no, message: "Contract no already exists"
	validates :status, inclusion: {in: %w(A C),
				message: "Value should be A or C"}
	validate :date_range_checker

private
def date_range_checker
	 if current_end_date < start_date || current_end_date > end_date_w_options
		errors.add(:current_end_date, "Should be between start_date and end_date_w_options")
	end
end

before_save	:calculate_funds_remaining

private
def calculate_funds_remaining
	self.funds_remaining = self.funded_amount - self.revenue_to_date	
end

end
