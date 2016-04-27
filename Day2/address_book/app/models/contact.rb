class Contact < ActiveRecord::Base
	validates :name, presence: true
	validates :address, presence: true
	validates :email_address, presence: true
	validates :email_address, uniqueness: true
	validates :phone, format: { with: /[0-9\-\+]{7,12}/i }
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
=begin
	def valid_email(contact)
		contact.email_address =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i ? true : false;
	end
	def valid_phone(contact) 652369890
		contact.phone.to_s =~ /^[0-9\-\+]{7,12}$/i ? true : false;
	end
	def present_name_address(contact)
		contact.name.present? && contact.address.present? ? true : false;
	end
	def validcontact(contact)
		valid_email(contact) && valid_phone(contact) && present_name_address(contact) ? true : false;
	end
=end
	def make_favorite(contact)
		contact.favorite = true
		contact.save
	end
	def self.beginning_with(letter)
		where("name like?", "#{letter}%")
	end
end