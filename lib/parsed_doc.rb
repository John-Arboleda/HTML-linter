require 'strscan'
require 'colorize'
require_relative 'doc_analysis'
require_relative 'tags_analysis'

class ParsedDoc
  attr_accessor :result
  attr_reader :parsed_array, :file_path

  def initialize(file_path)
    @file_path = file_path # file path
    @parsed_array = parsed_file(file_path)
    @result = run_tests(@parsed_array) # array of results
  end

  private

  def parsed_file(file_path)
    # local variable with the same name of the instance variable, but they different
    parsed_content = ''
    # Open file with permision "r" Read Only
    File.open(file_path, 'r') do |line|
      # Array of each line of the document
      parsed_content = line.readlines.map(&:chomp)
    end
    # Array of StringScanner elements
    parsed_content.map { |line| StringScanner.new(line) }
  end

  include DocAnalysis
  include TagsAnalysis

  def run_tests(parsed_array)
    test_results = []
    test_results << doctype_tag?(parsed_array) unless doctype_tag?(parsed_array).nil?
    test_results << html_tag?(parsed_array) unless html_tag?(parsed_array).nil?
    test_results << head_tag?(parsed_array) unless head_tag?(parsed_array).nil?
    test_results << body_tag?(parsed_array) unless body_tag?(parsed_array).nil?
    test_results << title_tag?(parsed_array) unless title_tag?(parsed_array).nil?
    test_results += tags_analysis(parsed_array)
    num_errors = test_results.length
    test_results.push("\nAnalyisis Completed: #{num_errors} issues found\n\n")
    test_results
  end
end
