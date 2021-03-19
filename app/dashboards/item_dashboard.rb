require "administrate/base_dashboard"

class ItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    cart_items: Field::HasMany,
    photos: HasManyAttachedField,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    category: Field::String,
    status: Field::String,
    materials: Field::String,
    width: Field::Number,
    length: Field::Number,
    height: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    price_cents: Field::Number,
    diameter: Field::Number,
    position: Field::String,
    rich_body: RichTextAreaField,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    title
    status
    cart_items
    created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    cart_items
    photos
    position
    title
    category
    status
    materials
    width
    length
    height
    diameter
    created_at
    updated_at
    price_cents
    description
    rich_body
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    photos
    position
    title
    price_cents
    category
    materials
    width
    length
    height
    diameter
    description
    rich_body
    status
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item)
  #   "Item ##{item.id}"
  # end
end
