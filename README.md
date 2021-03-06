![](https://img.shields.io/badge/Microverse-blueviolet)

# HTML Linter - Ruby Capstone Project

> This is the [Capstone Project for the Ruby module](https://www.notion.so/Build-your-own-linter-b17a3c22f7b940c98ca1980250720769) of the Microverse program. The main goal of this project is to put into practice the concepts of **Methods**, **Classes**, **Modules**, and **Testing.** in Ruby. 

## About the Project

As its name suggests, the HTML-linter enforces some basic HTML5 rules and good practices recommended by w3school article [HTML Style Guide and Coding Conventions](https://www.w3schools.com/html/html5_syntax.asp).

### Rules sample

1. The document should contain the tags`<!DOCTYPE> <html> <head> <body> <title>`. Attributes are optional. The lint match only if the tag is at the start of a line or after whitespaces. 

**Good**
```
<!DOCTYPE html>
<html lang="en">
```

**Bad**
```
<!DOCTYPE html><html lang="en">
```
2. All tags and attributes must be in lowercase, except !DOCTYPE

**Good**
```
<html lang="en">
```

**Bad**
```
<Html LANG="en">
```
3. Tag exists and is a valid HTML5 tag

**Good**
```
<section>
```

**Bad**
```
<sections>
```
4. No whitespace between an attribute and its value if any

**Good**
```
<link rel="stylesheet" href="styles.css" />
```

**Bad**
```
<link rel=    "stylesheet" href   =  "styles.css" />
```

## Installation

### Prerequisites

- Ruby 1.9
- Install the Ruby Gem [Colorize](https://github.com/fazibear/colorize#install)

### Setup

- Clone this repository on your computer. Check [this tutorial](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository) about cloning a GitHub repository
- Change the current working directory to the location where the respository was cloned. 
- Select `/html-Linter/bin` as the working directory.

### Usage

Run the HTML-linter typing `ruby main *path of your HTML file*` in the terminal, press **Enter**. `/html-Linter/bin` must be the working directory

If your file does not comply with linter rules, the result will be something like this:

![linter_results](./images/linter_results.png)

If there are no errors `analysis complete: 0 issues found` message will appear

### Testing

- Select `/html-Linter/testing` as the working directory.
- Run the command `bundle exec rspec` in the terminal.

## Authors

???? **John Arboleda**

- Github: [John-Arboleda](https://github.com/John-Arboleda)
- Twitter: [John_J_Arboleda](https://twitter.com/John_J_Arboleda)
- Linkedin: [john-jairo-arboleda-castillo](https://www.linkedin.com/in/john-jairo-arboleda-castillo/)

## ???? Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ?????? if you like this project!

## ???? License

This project is [MIT](lic.url) licensed.
