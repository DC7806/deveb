require 'slim'
require 'sprockets/es6'
require 'lib/models'

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


set :css_dir,        'assets/stylesheets'
set :images_dir,     'assets/images'
set :js_dir,         'assets/javascripts'
set :relative_links, true

activate :sprockets do |s|
  s.supported_output_extensions << '.es6'
end

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :development do
  activate :livereload do |site|
    site.livereload_css_target = "assets/css/application.css.scss"
  end
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :gzip
  activate :relative_assets
end

activate :gh_pages do |gh_pages|
  gh_pages.remote = 'git@github.com:DC7806/deveb.git'
end
