module IdeaBoardGraphql
  module Mutations
    class BaseUserRequired < GraphQL::Schema::Mutation
      def ready?(**args)
        if context[:current_user].present?
          true
        else
          raise Errors::Forbidden, "The requested action could not be performed."
        end
      end
    end
  end
end
