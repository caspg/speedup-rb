module Web::Views
  module EasyErrors
    def error_presenter
      display_errors if params && errors.any?
    end

    def error_class_for(attribute)
      return if !params || errors.empty?
      'has-error' if attribute_has_error?(attribute)
    end

    private

    def errors
      @errors ||= params.errors
    end

    def display_errors
      html.div(class: 'alert alert-danger form-errors') do
        h4('There was a problem with your submission:')
        ul do
          errors.to_h.each do |_k, errors|
            li("#{ errors.first.attribute_name }: #{ error_message[errors.first.validation] }")
          end
        end
      end
    end

    def error_message
      { presence: 'is required.', format: 'white spaces are not allowed.' }
    end

    def attribute_has_error?(attribute)
      attributes_with_error.include?(attribute.to_s)
    end

    def attributes_with_error
      @attributes_with_error ||= errors.to_a.map { |e| e.attribute_name }
    end
  end
end
