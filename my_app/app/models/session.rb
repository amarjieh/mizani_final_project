class Session < ActiveRecord::Base
	belongs_to :client
	belongs_to :dietitian
end
