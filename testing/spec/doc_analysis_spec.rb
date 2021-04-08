require_relative '../../lib/parsed_doc'
require_relative '../../lib/doc_analysis'
require 'strscan'

describe DocAnalysis do
  include DocAnalysis

  describe '#basic_analysis' do
    it 'Returns a colorized array of mandatory html tags missing' do
      file_path = 'negative_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(basic_analysis(parsed_array))
        .to eql([
                  "\e[0;31;49mError: \e[0mDOCTYPE tag not found",
                  "\e[0;31;49mError: \e[0mhtml tag not found",
                  "\e[0;31;49mError: \e[0mhead tag not found",
                  "\e[0;31;49mError: \e[0mbody tag not found"
                ])
    end
    it 'Returns nothing if mandatory html tags were include in the document' do
      file_path = 'positive_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(basic_analysis(parsed_array)).to eql([])
    end
  end
end
