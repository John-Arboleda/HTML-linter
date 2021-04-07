require_relative 'html_items.rb'
require 'strscan'
require 'colorize'

module DocAnalysis
  
  def basic_analysis(parsed_doc)
    basic_analysis_array = []
    doctype_regex = /^\s*<!DOCTYPE(\s*)(.*)(>)/
    html_regex = /^\s*<html(\s*)(.*)(>)/
    head_regex = /^\s*<head(\s*)(.*)(>)/
    body_regex = /^\s*<body(\s*)(.*)(>)/
    title_regex = /^\s*<title(\s*)(.*)(>)/

    doctype_exist = false
    html_exist = false
    head_exist = false
    body_exist = false
    title_exist = false

    parsed_doc.each do |line| 
      doctype_exist ||= true if line.check_until(doctype_regex)
      html_exist ||= true if line.check_until(html_regex)
      head_exist ||= true if line.check_until(head_regex)
      body_exist ||= true if line.check_until(body_regex)
      title_exist ||= true if line.check_until(title_regex)
    end

    basic_analysis_array.push("Error: ".colorize(:red) + "DOCTYPE tag not found") unless doctype_exist
    basic_analysis_array.push("Error: ".colorize(:red) + "html tag not found") unless html_exist
    basic_analysis_array.push("Error: ".colorize(:red) + "head tag not found") unless head_exist
    basic_analysis_array.push("Error: ".colorize(:red) + "body tag not found") unless body_exist
    basic_analysis_array.push("Warning: ".colorize(:yellow) + "title tag not found") unless title_exist

    basic_analysis_array
  end
end

  


