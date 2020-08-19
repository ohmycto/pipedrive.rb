module Pipedrive
  class Person < Base
    include ::Pipedrive::Operations::Search
    include ::Pipedrive::Operations::Read
    include ::Pipedrive::Operations::Create
    include ::Pipedrive::Operations::Update
    include ::Pipedrive::Operations::Delete
    include ::Pipedrive::Utils
  end
end
