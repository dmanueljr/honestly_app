class Message < ActiveRecord::Base
	belongs_to :user
	has_many :addresses

	validates :to_name, presence: true
	validates :msg, presence: true, length: {in: 8..300}
end
