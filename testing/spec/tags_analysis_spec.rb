require_relative '../../lib/parsed_doc'
require_relative '../../lib/tags_analysis'
require 'strscan'

describe TagsAnalysis do
  include TagsAnalysis

  let(:neg_parsed_array) { ParsedDoc.new('negative_example.html').parsed_array }
  let(:pos_parsed_array) { ParsedDoc.new('positive_example.html').parsed_array }

  describe '#tags_analysis' do
    it 'Returns a colorized array of errors from tags and attributes' do
      expect(tags_analysis(neg_parsed_array))
        .to eql([
                  "\e[0;34;49mSuggestion: \e[0mline 13 col 69: avoid whitespace after attribute",
                  "\e[0;34;49mSuggestion: \e[0m line 13 col 70: avoid whitespace after attribute",
                  "\e[0;33;49mWarning: \e[0mline 17 col 3: tag H1 is not lowercase",
                  "\e[0;31;49mError: \e[0mline 19 col 3: invalid tag artic",
                  "\e[0;33;49mWarning: \e[0mline 23 col 37: attribute Href is not lowercase",
                  "\e[0;34;49mSuggestion: \e[0m line 23 col 41: avoid whitespace after attribute"
                ])
    end
    it 'Returns nothing if tags and attributes are formated properly' do
      expect(tags_analysis(pos_parsed_array)).to eql([])
    end
  end

  describe '#valid_tag' do
    it 'Error artic is not a valid html tag' do
      expect(valid_tag?(neg_parsed_array[18], 18))
        .to eql(["\e[0;31;49mError: \e[0mline 19 col 3: invalid tag artic"])
    end
    it 'article is a valid html tag' do
      expect(valid_tag?(pos_parsed_array[19], 19))
        .to eql([])
    end
  end
end
