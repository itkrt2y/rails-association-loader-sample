# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :blogs, [Types::BlogType], null: false

    field :blog_dataloader, [Types::BlogType], null: false
    def blog_dataloader
      dataloader.with(Sources::Association, :blogs).load(object)
    end

    field :blogs_connection, Types::BlogType.connection_type, null: false, method: :blogs

    field :blogs_connection_dataloader, Types::BlogType.connection_type, null: false
    def blogs_connection_dataloader
      dataloader.with(Sources::Association, :blogs).load(object)
    end
  end
end
