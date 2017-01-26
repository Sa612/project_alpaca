Rails.application.routes.draw do
    root 'home#home'

    namespace :admin, as: 'admin' do
        resources :dashboards

        resources :courses

        resources :words
    end

    namespace :api, defaults: {format: 'json'} do
        resources :courses
    end
end
