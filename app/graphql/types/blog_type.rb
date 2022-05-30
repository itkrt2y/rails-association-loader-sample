# frozen_string_literal: true

module Types
  class BlogType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::UserType, null: false

    field :user_dataloader, Types::UserType, null: false
    def user_dataloader
      dataloader.with(Sources::Association, :user).load(object)
    end

    field :comments, [Types::CommentType], null: false

    field :comments_dataloader, [Types::CommentType], null: false
    def comments_dataloader
      dataloader.with(Sources::Association, :comments).load(object)
    end

    field :comments_connection, Types::CommentType.connection_type, null: false, method: :comments

    field :comments_connection_dataloader, Types::CommentType.connection_type, null: false
    def comments_connection_dataloader
      dataloader.with(Sources::Association, :comments).load(object)
    end
  end
end
