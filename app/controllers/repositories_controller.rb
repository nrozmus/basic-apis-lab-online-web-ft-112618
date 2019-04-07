class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = ENV['clientID']
      req.params['client_secret'] = ENV['clientSecret']
      req.params['q'] = params['query']
    end

    @repos = JSON.parse(resp.body)['items']
    render 'search'
  end
end