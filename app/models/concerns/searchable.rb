# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  included do
    require "elasticsearch/model"
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    index_name "#{name.downcase}-#{Rails.env}"
  end
end
