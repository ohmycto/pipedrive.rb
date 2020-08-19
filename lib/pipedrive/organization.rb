module Pipedrive
  class Organization < Base
    include ::Pipedrive::Operations::Read
    include ::Pipedrive::Operations::Search
    include ::Pipedrive::Operations::Create
    include ::Pipedrive::Operations::Update
    include ::Pipedrive::Operations::Delete
    include ::Pipedrive::Utils

    def deals(*args)
      params = args.extract_options!
      params[:org_id] ||= args[0]
      fail 'org_id is missing' unless params[:org_id]
      return to_enum(:deals, params) unless block_given?
      follow_pagination(:make_api_call, [:get, "#{params[:org_id]}/deals"], params) { |item| yield item }
    end
  end
end
