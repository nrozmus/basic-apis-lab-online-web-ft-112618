class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "f8fcda791391a365ad91"
    secret = "97c5a51230b7ad645a0c7a07753bacf8ae56b1ad"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end