require 'redcarpet/render_strip'

module MarkdownHelper
  HTML_DEFAULTS = {
    escape_html: false, filter_html: false, autolink: true,
    hard_wrap: true, xhtml: true, safe_links_only: true,
    no_styles: true, no_images: true, no_links: false,
    with_toc_data: false, prettify: false, link_attributes: {}
  }

  def markdown_to_html(markup, options = {})
    markdown_parser(html_renderer(options)).render(markup).html_safe
  end

  def markdown_to_text(markup)
    markdown_parser(text_renderer).render(markup).html_safe
  end

  private

  def html_renderer(options)
    Redcarpet::Render::HTML.new(HTML_DEFAULTS.merge(options))
  end

  def text_renderer
    Redcarpet::Render::StripDown.new
  end

  def markdown_parser(renderer)
    Redcarpet::Markdown.new(renderer)
  end
end
