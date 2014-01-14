module ActionView::Helpers::TextHelper
	def simple_format(text, html_options={}, options={})
		text = '' if text.nil?
		text = text.dup
		text = sanitize(text) unless options[:sanitize] == false
		text = text.to_str
		text.gsub!(/\r\n?/, "\n")                    # \r\n and \r -> \n
		text.gsub!(/([^\n]\n)(?=[^\n])/, '\1<br />') # 1 newline   -> br
		text.html_safe
	end
end

module ActiveRecord
  # = Active Record Has And Belongs To Many Association
  module Associations
    class HasAndBelongsToManyAssociation < CollectionAssociation
    	def handle_dependency
    	end
    end
end
end
