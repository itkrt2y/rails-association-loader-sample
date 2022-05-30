# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :blogs, [Type::BlogType], null: false
    def blogs = dataloader.with(Sources::Association, :blogs).load(object)

    field :blogs_raw, [Types::BlogType], null: false, method: :blogs
  end
end
