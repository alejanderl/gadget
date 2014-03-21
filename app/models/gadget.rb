class Gadget < ActiveRecord::Base

	has_many   :images, dependent: :destroy
	belongs_to :user

	accepts_nested_attributes_for :images, allow_destroy: true


	validates :name,     presence: true
	validates :user_id,  presence: true
end
