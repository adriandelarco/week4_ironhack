class Comment < ActiveRecord::Base
	belongs_to :concerts, :counter_cache => true
	validates :text, presence: true
end
