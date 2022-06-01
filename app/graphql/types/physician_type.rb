# frozen_string_literal: true

module Types
  class PhysicianType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :physicians, [Types::PhysicianType], null: false
    def physicians
      dataloader.with(Sources::Association, :physicians).load(object)
    end
  end
end
