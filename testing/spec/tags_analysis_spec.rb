require_relative '../../lib/parsed_doc.rb'
require_relative '../../lib/tags_analysis.rb'
require 'strscan'

describe TagsAnalysis do
  include TagsAnalysis

  describe '#tags_analysis' do
    it 'Returns a colorized array of errors from tags and attributes' do
      file_path = 'negative_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(tags_analysis(parsed_array)).to eql([
        "\e[0;34;49mSuggestion: \e[0mline 13 col 69: avoid whitespace after attribute",
        "\e[0;34;49mSuggestion: \e[0m line 13 col 70: avoid whitespace after attribute",
        "\e[0;33;49mWarning: \e[0mline 17 col 3: tag H1 is not lowercase",
        "\e[0;31;49mError: \e[0mline 19 col 3: invalid tag artic",
        "\e[0;33;49mWarning: \e[0mline 23 col 37: attribute Href is not lowercase",
        "\e[0;34;49mSuggestion: \e[0m line 23 col 41: avoid whitespace after attribute",
        ]
      )
    end
    it 'Returns nothing if tags and attributes are formated properly' do
      file_path = 'positive_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(tags_analysis(parsed_array)).to eql([])
    end
  end
end