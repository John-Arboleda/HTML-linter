require 'strscan'
require 'colorize'
require_relative 'doc_analysis.rb'
require_relative 'tags_analysis.rb'

class ParsedDoc
  attr_accessor :num_errors, :result
  attr_reader :parsed_array, :file_path

  def initialize(file_path)
    @file_path = file_path # file path
    @parsed_array = parsed_file(file_path)
    @result = run_tests(@parsed_array) # array of results
    @num_errors = 0
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
    scanned_content = parsed_content.map { |line| line = StringScanner.new(line) }
    scanned_content
  end

  include DocAnalysis
  include TagsAnalysis

  def run_tests(parsed_array)
    test_results = []
    test_results += basic_analysis(parsed_array)
    test_results += tags_analysis(parsed_array)
    test_results
  end
end