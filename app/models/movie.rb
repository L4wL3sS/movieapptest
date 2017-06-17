class Movie < ApplicationRecord
	has_many :comments
	has_many :reviews

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: {maximum: 100}
	validates :stars, :inclusion => 0..10
	validates :stars, :numericality => {only_integer: true}
	validates :year, :numericality =>  {only_integer: true, greater_than_or_equal_to: 1895 , less_than: 2030}

	# paperclip validation req.
	# has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	# validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	has_attached_file :image, styles: { medium: "400x600#", thumb: "100x100#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	def self.search(search)
  	#where("actor like ?", "%" + "%#{search}%" + "%")
  	where("name like ?", "%" + "%#{search}%" + "%")
	end

	def self.search_director(search)
  	#where("actor like ?", "%" + "%#{search}%" + "%")
  	where("director like ?", "%" + "%#{search}%" + "%")
	end

	def self.search_year(search_year)
  	where(year: search_year)
	end

	def self.search_genre(search_genre)
  	where("genre like ?", "%" + "%#{search_genre}%" + "%")
	end

end
