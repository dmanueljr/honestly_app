class Address < ActiveRecord::Base
	belongs_to :message

	validates :address_1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip_code, presence: true
end
