require 'rouge/plugins/redcarpet'

class MarkdownService
  class Renderer < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  attr_reader :markdown

  def self.call(markdown)
    new(markdown).call
  end

  def initialize(markdown)
    @markdown = markdown
  end

  def call
    render
  end

  private

  def markdown_renderer
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true,
      :tables => true
    }

    Redcarpet::Markdown.new(Renderer, options)
  end

  def render
    markdown_renderer.render(markdown).html_safe
  end
end
