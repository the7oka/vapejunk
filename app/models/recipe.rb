class Recipe < ApplicationRecord
	belongs_to :user
	has_many :flavors
	accepts_nested_attributes_for :flavors, :allow_destroy => true
	validates_numericality_of :nic_strength, less_than_or_equal_to: 100, greater_than_or_equal_to: 0
	validates_numericality_of :nic_vg, less_than_or_equal_to: 100, greater_than_or_equal_to: 0
	validates_numericality_of :target_nic, less_than_or_equal_to: 100, greater_than_or_equal_to: 0
	validates_numericality_of :target_vg, less_than_or_equal_to: 100, greater_than_or_equal_to: 0
	has_attached_file :avatar, styles: { medium: "300x300>" },:convert_options => {:medium => "-resize 300x300^ \ -gravity center -extent 300x300" }, default_url: "/assets/missing.jpg"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
