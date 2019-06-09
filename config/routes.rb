Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'users/sessions' }

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :passed_tests, only: %i[show update] do
    member do  # GET /passed_tests/101/result
      get :result
    end
  end

end
