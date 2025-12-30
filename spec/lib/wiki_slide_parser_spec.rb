# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/training/wiki_slide_parser"

RSpec.describe WikiSlideParser, :focus do
    it 'removes stray curly braces caused by translate tags' do
      wikitext = <<~WIKI
      <translate>
      Some content
      </translate>
      }}
    WIKI

      parser = WikiSlideParser.new(wikitext)
      html = parser.content

      expect(html).not_to include('}}')
    end
end
