# Markdown
class SchemaRenderer < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do
    def render_table(json_schema_path)
      base_path = "~/ripple/ripple-lib/src/common/schemas/"
      file_path = File.expand_path(File.join(base_path, json_schema_path))
      `json-schema-to-markdown #{file_path} #{base_path}`
    end

    def render_request(method, return_name, parameter_name, fixture_filename)
      base_path = "~/ripple/ripple-lib/test/fixtures/requests/"
      file_path = File.expand_path(File.join(base_path, fixture_filename))
      "\n```javascript\nconst #{parameter_name} = " +
        File.read(file_path) + ";\nreturn api.#{method}(#{parameter_name})" +
        ".then(#{return_name} =>\n  {/* ... */});\n```\n"
    end

    def render_response(fixture_filename)
      base_path = "~/ripple/ripple-lib/test/fixtures/responses/"
      file_path = File.expand_path(File.join(base_path, fixture_filename))
      "\n```json\n" + File.read(file_path) + "\n```\n"
    end
  end
end

::Middleman::Extensions.register(:schema_renderer, SchemaRenderer)
activate :schema_renderer

set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Activate the syntax highlighter
activate :syntax

activate :autoprefixer do |config|
  config.browsers = ['last 2 version', 'Firefox ESR']
  config.cascade  = false
  config.inline   = true
end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

# Build Configuration
configure :build do
  # activate :minify_css
  # activate :minify_javascript
  # activate :relative_assets
  # activate :asset_hash
  # activate :gzip
end

