class Cocktail < ApplicationRecord
	has_many :doses, dependent: :destroy
	has_many :ingredients, through: :doses

	has_one_attached :photo

	$categories = Cocktail.distinct.pluck(:category)
	$alcoholics = Cocktail.distinct.pluck(:alcoholic)
	$glasses = Cocktail.distinct.pluck(:glass)

	include PgSearch::Model
		pg_search_scope :search_by_name,
			against: :name,
			using: {
				tsearch: { prefix: true }
			}

  validates :name, presence: true, uniqueness: true
end
