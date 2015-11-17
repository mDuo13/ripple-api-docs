# Markdown
class SchemaRenderer < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do
    def build_path(path)
      root_path = File.expand_path(File.dirname(__FILE__));
      File.join(root_path, 'ripple-lib', path)
    end

    def render_table(json_schema_path)
      schemas_path = build_path("src/common/schemas/")
      file_path = File.join(schemas_path, json_schema_path)
      `json-schema-to-markdown #{file_path} #{schemas_path}`
    end

    def render_request(before, fixture_filename, after)
      file_path = build_path(File.join("test/fixtures/requests",
        fixture_filename))
      contents = File.read(file_path).rstrip
      "\n```javascript\n#{before}#{contents}#{after}\n```\n"
    end

    def render_prepare_request(tx_type, fixture_filename)
      method = "prepare" + tx_type[0].capitalize + tx_type[1..-1]
      before = "const address = 'r9cZA1mLK5R5Am25ArfXFmqgNwjZgnfk59';\n" +
        "const #{tx_type} = "
      after = ";\nreturn api.#{method}(address, #{tx_type})\n  .then(prepared" +
        " => {/* ... */});"
      render_request(before, fixture_filename, after)
    end

    def render_json(fixture_filename)
      file_path = build_path(File.join("test/fixtures/", fixture_filename))
      contents = File.read(file_path).rstrip
      "\n```json\n#{contents}\n```\n"
    end

    def render_response(fixture_filename)
      render_json(File.join("responses", fixture_filename))
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

