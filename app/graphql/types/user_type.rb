# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :blogs, [Types::BlogType], null: false do
      argument :order, Types::OrderEnum, required: false, default_value: :asc
    end
    def blogs(order:)
      object.blogs.order(id: order)
    end

    field :blog_dataloader, [Types::BlogType], null: false do
      argument :order, Types::OrderEnum, required: false, default_value: :asc
    end
    def blog_dataloader(order:)
      dataloader.with(Sources::Association, :blogs, ::Blog.order(id: order)).load(object)
    end

    field :blogs_connection, Types::BlogType.connection_type, null: false do
      argument :order, Types::OrderEnum, required: false, default_value: :asc
    end
    def blogs_connection(order:)
      object.blogs.order(id: order)
    end

    field :blogs_connection_dataloader, Types::BlogType.connection_type, null: false do
      argument :order, Types::OrderEnum, required: false, default_value: :asc
    end
    def blogs_connection_dataloader(order:)
      dataloader.with(Sources::Association, :blogs, ::Blog.order(id: order)).load(object)
    end
  end
end
