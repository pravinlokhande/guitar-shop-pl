class Guitar < ApplicationRecord
  include Searchable
  before_destroy :not_referenced_by_any_line_item
  has_many :line_items

  settings analysis: {
    analyzer: {
      autocomplete: { tokenizer: "autocomplete", filter: "lowercase" },
      autocomplete_search: { tokenizer: "autocomplete", filter: "lowercase" }
    },
    tokenizer: { autocomplete: { type: "ngram", min_gram: 3, max_gram: 15, token_chars: %w[letter digit] } }
  } do
    mappings dynamic: "false" do
      indexes :brand, type: "string", analyzer: "standard"
      indexes :model, type: "string", analyzer: "standard"
      indexes :description, type: "string", analyzer: "standard"
      indexes :completion_field, type: "string", analyzer: "autocomplete", search_analyzer: "standard"
    end
  end

  def as_indexed_json(_options = {})
	{
	  uid: uid,
	  brand: brand,
	  model: model,
	  description: description,
	  price: price,
	}
  end

  private

  def def completion_field
    "#{brand} #{model}".downcase
  end

  def not_referenced_by_any_line_item
  	unless line_items.empty?
  	  errors.add(:base, "Line item present.")
  	  throw :abort
  	end
  end
end
