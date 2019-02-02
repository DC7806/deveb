module ApplicationHelpers
  def render_repo_url(repo)
    return if repo.nil?

    link_to "#{ENV['GITHUB_ACCOUNT']}/#{repo}", target: :_blank, class: 'button showcase__button is-medium' do
      content_tag :i, '', class: 'fab fa-github'
    end
  end

  def render_page_title(page_title=nil)
    site_name = ENV['SITE_NAME']
    
    return site_name if page_title.nil?
    "#{page_title} | #{site_name}"
  end
end
