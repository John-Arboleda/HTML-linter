require_relative '../lib/parsed_doc.rb'
require_relative '../lib/html_items.rb'
require 'strscan'
require 'colorize'

file_path = "testing/positive_example.html" # ARGV.shift

analysis = ParsedDoc.new(file_path)

puts analysis.result