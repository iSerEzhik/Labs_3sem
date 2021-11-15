# frozen_string_literal: true

Rails.application.routes.draw do
  get 'laba8/input'
  get 'laba8/view'
  root to: 'laba8#input'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
