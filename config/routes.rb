MongoBrowser::Application.routes.draw do

  root "browser#index"

  match ":database" => "browser#collections", via: [:get, :post]
  match ":database/:collection" => "browser#documents", via: [:get, :post]
  match ":database/:collection/:documentid" => "browser#docinspector", via: [:get, :post]

end
