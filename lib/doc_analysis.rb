require 'strscan'
require 'colorize'

module DocAnalysis
  def doctype_tag?(parsed_doc)
    doctype_regex = /^\s*<!DOCTYPE(\s*)(.*)(>)/
    doctype_exist = parsed_doc.any? { |line| !line.check_until(doctype_regex).nil? }
    return "#{'Error: '.colorize(:red)}DOCTYPE tag not found" unless doctype_exist
  end

  def html_tag?(parsed_doc)
    html_regex = /^\s*<html(\s*)(.*)(>)/
    html_exist = parsed_doc.any? { |line| !line.check_until(html_regex).nil? }
    return "#{'Error: '.colorize(:red)}html tag not found" unless html_exist
  end

  def head_tag?(parsed_doc)
    head_regex = /^\s*<head(\s*)(.*)(>)/
    head_exist = parsed_doc.any? { |line| !line.check_until(head_regex).nil? }
    return "#{'Error: '.colorize(:red)}head tag not found" unless head_exist
  end

  def body_tag?(parsed_doc)
    body_regex = /^\s*<body(\s*)(.*)(>)/
    body_exist = parsed_doc.any? { |line| !line.check_until(body_regex).nil? }
    return "#{'Error: '.colorize(:red)}body tag not found" unless body_exist
  end

  def title_tag?(parsed_doc)
    title_regex = /^\s*<title(\s*)(.*)(>)/
    title_exist = parsed_doc.any? { |line| !line.check_until(title_regex).nil? }
    return "#{'Warning: '.colorize(:yellow)}title tag not found" unless title_exist
  end
end
