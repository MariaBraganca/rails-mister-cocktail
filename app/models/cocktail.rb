class Cocktail < ApplicationRecord
	has_many :doses, dependent: :destroy
	has_many :ingredients, through: :doses

	has_one_attached :photo

	$categories = Cocktail.distinct.order(:category).pluck(:category)
	$alcoholics = Cocktail.distinct.order(:alcoholic).pluck(:alcoholic)
	$glasses = Cocktail.distinct.order(:glass).pluck(:glass)

	include PgSearch::Model
	pg_search_scope :search_by_name,
		against: :name,
		associated_against: { ingredients: :name },
		using: {
			tsearch: { prefix: true }
		}

  validates :name, presence: true, uniqueness: true
  # validates :category, uniqueness: true, case_sensitive: true
  # validates :alcoholic, uniqueness: true, case_sensitive: true
  # validates :glass, uniqueness: true, case_sensitive: true
end
