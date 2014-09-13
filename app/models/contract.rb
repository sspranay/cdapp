class Contract < ActiveRecord::Base
validates :account, presence: true
	validates :customer, presence: true
	validates :title, presence: true
	validates :contract_no, presence: true, uniqueness: true
	validates :status, inclusion: {in: %w(A C),
				message: "Value should be A or C"}

before_save	:calculate_funds_remaining

private
def calculate_funds_remaining
	self.funds_remaining = self.funded_amount - self.revenue_to_date	
end

end
