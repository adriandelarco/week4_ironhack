class Concert < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "960x690>", thumb: "300x225>" }, default_url: "/assets/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	has_many :comments
	validates :artist, presence: true
	validates :venue, presence: true
	validates :city, presence: true
	validates :datetime, presence: true
	validates :price, presence: true
	validates :price, numericality: { only_integer: true }
	validates :description, presence: true
end
