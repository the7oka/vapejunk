class Flavor < ApplicationRecord
	belongs_to :recipe
	validates_numericality_of :percentage, less_than_or_equal_to: 100, greater_than_or_equal_to: 0
end
