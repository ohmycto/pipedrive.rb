module Pipedrive
  class Deal < Base
    include ::Pipedrive::Operations::Create
    include ::Pipedrive::Operations::Read
    include ::Pipedrive::Operations::Search
    include ::Pipedrive::Operations::Update
    include ::Pipedrive::Operations::Delete
  end
end
