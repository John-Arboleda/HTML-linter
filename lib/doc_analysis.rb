require 'strscan'
require 'colorize'

# rubocop: disable Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
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

    unless doctype_exist
      basic_analysis_array.push("#{'Error: '
        .colorize(:red)}DOCTYPE tag not found")
    end
    unless html_exist
      basic_analysis_array.push("#{'Error: '
        .colorize(:red)}html tag not found")
    end
    unless head_exist
      basic_analysis_array.push("#{'Error: '
        .colorize(:red)}head tag not found")
    end
    unless body_exist
      basic_analysis_array.push("#{'Error: '
        .colorize(:red)}body tag not found")
    end
    unless title_exist
      basic_analysis_array.push("#{'Warning: '
        .colorize(:yellow)}title tag not found")
    end

    basic_analysis_array
  end
end
# rubocop: enable Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
