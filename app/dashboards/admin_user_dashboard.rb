require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    email: Field::String.with_options(searchable: true),
    password: Field::Password.with_options(searchable: false),
    first_name: Field::String.with_options(searchable: false),
    last_name: Field::String.with_options(searchable: false),
    type: Field::String.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    posts
    id
    email
    first_name
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    posts
    id
    email
    first_name
    last_name
    type
  ].freeze

  FORM_ATTRIBUTES = %i[
    email
    password
    first_name
    last_name
    type
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
