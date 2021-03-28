# frozen_string_literal: true

require 'base64'
require 'simplecov'

# Custom formatter that inlines assets into html result.
# It could be removed if [PR] is merged into simplecov-html gem.
# [PR]: https://github.com/simplecov-ruby/simplecov-html/pull/107/files
class InliningFormatter < SimpleCov::Formatter::HTMLFormatter
  def format(result)
    File.open(File.join(output_path, 'index.html'), 'wb') do |file|
      file.puts template('layout').result(binding)
    end
    puts output_message(result)
  end

  private

  def assets_path(name)
    path = File.join(Gem.loaded_specs['simplecov-html'].full_gem_path, 'public', name)

    # Only have a few content types, just hardcode them
    content_type = {
      '.js' => 'text/javascript',
      '.png' => 'image/png',
      '.gif' => 'image/gif',
      '.css' => 'text/css'
    }.fetch(File.extname(name))

    base64_content = Base64.strict_encode64(File.read(path))
    "data:#{content_type};base64,#{base64_content}"
  rescue Errno::ENOENT => e
    e.message =~ /favicon.png/ ? warn('Warning: favicon.png file is missing') : raise
  end
end

SimpleCov.collate Dir['coverage-resultset/*/.resultset.json'], 'rails' do
  formatter InliningFormatter
  enable_coverage :branch
end
