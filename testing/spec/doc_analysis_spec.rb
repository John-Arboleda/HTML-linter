require_relative '../../lib/parsed_doc'
require_relative '../../lib/doc_analysis'
require 'strscan'

describe DocAnalysis do
  include DocAnalysis

  describe '#doctype_tag?' do
    it 'Returns a colorized string DOCTYPE tag not found' do
      file_path = 'negative_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(doctype_tag?(parsed_array))
        .to eql("\e[0;31;49mError: \e[0mDOCTYPE tag not found")
    end
    it 'Returns nothing if contains the DOCTYPE tag' do
      file_path = 'positive_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(doctype_tag?(parsed_array))
        .to eql(nil)
    end
  end

  describe '#html_tag?' do
    it 'Returns a colorized string html tag not found' do
      file_path = 'negative_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(html_tag?(parsed_array))
        .to eql("\e[0;31;49mError: \e[0mhtml tag not found")
    end
    it 'Returns nothing if contains the html tag' do
      file_path = 'positive_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(html_tag?(parsed_array))
        .to eql(nil)
    end
  end

  describe '#head_tag?' do
    it 'Returns a colorized string head tag not found' do
      file_path = 'negative_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(head_tag?(parsed_array))
        .to eql("\e[0;31;49mError: \e[0mhead tag not found")
    end
    it 'Returns nothing if contains the head tag' do
      file_path = 'positive_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(head_tag?(parsed_array))
        .to eql(nil)
    end
  end

  describe '#body_tag?' do
    it 'Returns a colorized string body tag not found' do
      file_path = 'negative_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(body_tag?(parsed_array))
        .to eql("\e[0;31;49mError: \e[0mbody tag not found")
    end
    it 'Returns nothing if contains the body tag' do
      file_path = 'positive_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(body_tag?(parsed_array))
        .to eql(nil)
    end
  end

  describe '#title_tag?' do
    it 'Returns a colorized warning title tag not found' do
      file_path = 'negative_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(title_tag?(parsed_array))
        .to eql("\e[0;33;49mWarning: \e[0mtitle tag not found")
    end
    it 'Returns nothing if contains the title tag' do
      file_path = 'positive_example.html'
      parsed_array = ParsedDoc.new(file_path).parsed_array
      expect(title_tag?(parsed_array))
        .to eql(nil)
    end
  end
end
