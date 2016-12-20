Rails.application.routes.draw do
    root to: 'pages#home'
    get 'about', to:'pages#about'
    get 'analog', controller: 'pages', action: 'analog'
    post 'analog-ready', controller: 'business', action: 'import'
end
