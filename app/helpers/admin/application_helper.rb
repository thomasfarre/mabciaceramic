module Admin
  module ApplicationHelper
    def country_name_for(country_code)
      Country[country_code].unofficial_names.first if country_code
    end

    def nav_link_state(resource)
      resource_name == resource ? 'active' : 'inactive'
    end

    def markdown(text)
      if text.present?
        content_tag :div, class: 'markdown' do
          Kramdown::Document.new(text).to_html.html_safe
        end
      end
    end

    def attribute_from(page, attribute_name)
      page.attributes.find(attribute_name) do |attribute|
        attribute.name == attribute_name.to_s
      end
    end

    def render_field_with_wrapper_for(page, attribute_name, form, options = {})
      attribute = attribute_from(page, attribute_name)
      content_tag(:div, class: "field-unit field-unit--#{attribute.html_class}") do
        render_field(attribute, { f: form }.merge(options))
      end
    end

    def render_field(field, locals = {})
      locals.merge!(field: field).reverse_merge!(default_options)
      render locals: locals, partial: field.to_partial_path
    end

    def default_options
      {
        placeholder: '',
        label: '',
        hint: ''
      }
    end
  end
end
