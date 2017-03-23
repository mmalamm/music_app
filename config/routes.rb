Rails.application.routes.draw do
  resource :user, only: [:create, :show, :new]
  resource :session, only: [:new, :create, :destroy]
end
