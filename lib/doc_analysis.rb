require_relative 'html_items.rb'
require 'strscan'
require 'colorize'

module DocAnalysis
  
  def basic_analysis(parsed_doc)
    basic_analysis_array = []
    doctype_regex = /^<!DOCTYPE(\s*)(.*)(>)/
    doctype_exist = parsed_doc.any? { |i| i.scan(doctype_regex) }
    basic_analysis_array.push("DOCTYPE tag not found") if !doctype_exist
    basic_analysis_array
  end
end

  


