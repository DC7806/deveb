require 'slim'
require 'sprockets/es6'
require 'lib/models'
require 'helpers/application_helpers'

helpers ApplicationHelpers

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes

activate :blog do |blog|
  blog.prefix = 'blogs'
  blog.permalink = "{permalink}"
  blog.default_extension = ".md"
  blog.paginate = true
  blog.per_page = 1
  blog.new_article_template = File.expand_path("source/blogs/template.html.erb", File.dirname(__FILE__))
end

activate :sprockets do |s|
  s.supported_output_extensions << '.es6'
end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


set :css_dir,        'assets/stylesheets'
set :images_dir,     'assets/images'
set :js_dir,         'assets/javascripts'
set :fonts_dir,      'assets/fonts'

set :relative_links, true

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
  activate :asset_hash
end

activate :gh_pages do |gh_pages|
  gh_pages.remote = ENV['GIT_PAGE_REPO']
end
