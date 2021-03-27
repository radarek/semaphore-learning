require 'simplecov'

SimpleCov.collate Dir["simplecov-resultset/*/.resultset.json"] do
  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::SimpleFormatter,
    SimpleCov::Formatter::HTMLFormatter
  ])
end
