class Session < ActiveRecord::Base
	belongs_to :client
	belongs_to :dietitian
    validates :dietitian_id, :presence => true
    validates :time, :presence => true
    validates :status, :presence => true
end
