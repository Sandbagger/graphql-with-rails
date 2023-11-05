# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :authors, [Types::AuthorType], null: false
    def authors
      Author.all
    end

    field :author, Types::AuthorType, null: false do
      argument :id, ID, required: true
    end
    def author(id:)
      Author.find(id)
    end
  end
end
