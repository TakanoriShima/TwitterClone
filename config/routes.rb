Rails.application.routes.draw do
  root 'users#top'
  # トップ
  get '/top', to: 'users#top', as: :top

  # ユーザー登録ページ
  get '/sign_up', to: 'users#sign_up', as: :sign_up
  # ユーザー登録処理
  post '/sign_up', to: 'users#sign_up_process'

  # サインインページ
  get '/sign_in', to: 'users#sign_in', as: :sign_in
  # サインイン処理
  post '/sign_in', to: 'users#sign_in_process'
  # サインアウト処理
  get '/sign_out', to: 'users#sign_out', as: :sign_out

  # プロフィール編集ページ（プロフィールページの定義よりも上に書く必要がある）
  get '/profile/edit', to: 'users#edit', as: :profile_edit
  # プロフィール更新処理
  post '/profile/edit', to: 'users#update'
  # プロフィールページ
  get '/profile/(:id)', to: 'users#show', as: :profile

  # フォロー処理
  get '/follow/(:id)', to: 'users#follow', as: :follow
  # フォローリストページ
  get '/follow_list/(:id)', to: 'users#follow_list', as: :follow_list
  # フォロワーリストページ
  get '/follower_list/(:id)', to: 'users#follower_list', as: :follower_list

  # 投稿系
  resources :posts do
    member do
      # いいね
      get 'like', to: 'posts#like', as: :like
      # コメント
      post 'comment', to: 'posts#comment', as: :comment
    end
  end
end
