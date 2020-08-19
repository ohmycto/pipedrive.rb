module Pipedrive
  module Operations
    module Search
      extend ActiveSupport::Concern
      include ::Enumerable
      include ::Pipedrive::Utils

      def search(*args)
        params = args.extract_options!
        params[:term] ||= args[0]
        fail 'term is missing' unless params[:term]
        return to_enum(:search, params) unless block_given?
        follow_pagination(:make_api_call, [:get, 'search'], params) { |item| yield item }
      end

      def find(*args)
        params = args.extract_options!
        params[:term] ||= args[0]
        params[:exact_match] = true
        fail 'term is missing' unless params[:term]
        fetch_one(:make_api_call, [:get, 'search'], params)
      end
    end
  end
end
