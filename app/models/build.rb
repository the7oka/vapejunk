class Build < ApplicationRecord
	belongs_to :user
	has_attached_file :avatar, styles: { medium: "300x300>" },:convert_options => {:medium => "-resize 300x300^ \ -gravity center -extent 300x300" }, default_url: "/assets/missing.jpg"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
