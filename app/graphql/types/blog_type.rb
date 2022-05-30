# frozen_string_literal: true

module Types
  class BlogType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::UserType, null: false
    def user = dataloader.with(Sources::Association, :user).load(object)

    field :user_raw, Types::UserType, null: false, method: :user

    field :comments, [Types::CommentType], null: false
    def comments = dataloader.with(Sources::Association, :comments).load(object)

    field :comments_raw, [Types::CommentType], null: false, method: :comments
  end
end
