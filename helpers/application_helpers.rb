module ApplicationHelpers
def render_repo_url(repo)
  return if repo.nil?

  link_to "#{ENV['GITHUB_ACCOUNT']}/#{repo}", target: :_blank, class: 'button showcase__button is-medium' do
    content_tag :i, '', class: 'fab fa-github'
  end
end
end
