Rails.application.routes.draw do
  
  root to: 'says#home' # トップページにホームを表示させる
  
  resources :says do
    collection do
      post :confirm
    end
  end
end
