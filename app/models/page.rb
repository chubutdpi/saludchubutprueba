class Page < ApplicationRecord
	has_many :tabs, inverse_of: :page, dependent: :delete_all
  	accepts_nested_attributes_for :tabs, reject_if: :all_blank, allow_destroy: true
end
