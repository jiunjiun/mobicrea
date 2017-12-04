Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }
  devise_scope :user do
    resource :registration,
      only: [:edit, :update],
      path: :users,
      path_names: { new: 'sign_up' },
      controller: 'users/registrations',
      as: :user_registration
  end

  namespace :admin do
    root 'home#index'

    resources :users
    resources :sliders do
      put :update_position, on: :collection
    end

    resources :services do
      resources :photos, controller: 'service_photos' do
        put :update_position, on: :collection
      end
      resources :references, controller: 'service_references' do
        put :update_position, on: :collection
      end

      resources :service_furnitures do
        resources :products, except: [:index] do
          resources :product_items, except: [:index]
          resources :photos, controller: 'product_photos' do
            put :update_position, on: :collection
          end
        end
      end
    end

    resources :success_cases do
      resources :products, except: [:index] do
        resources :product_items, except: [:index]
        resources :photos, controller: 'product_photos' do
          put :update_position, on: :collection
        end
      end
    end

    resources :brands do
      resources :products, except: [:index] do
        resources :product_items, except: [:index]
        resources :photos, controller: 'product_photos' do
          put :update_position, on: :collection
        end
      end
    end

    resource :summernote_upload, only: [:create]
  end


  # 關於元皿
  get 'about',     to: 'about#index'

  # 服務內容
  resources :services, only: [:index, :show] do
    resources :service_furnitures, only: [:show]
  end
  resources :products, only: [:show]

  # 成功案例
  resources :success_cases, only: [:index, :show]

  # 成功案例
  resources :brands, only: [:index, :show]


  # 服務內容
  # get 'service',                      to: 'service#index',        as: 'service'
  # get 'service_collection',           to: 'service#collection',   as: 'collection'
  # get 'service_furniture',            to: 'service#furniture',       as: 'furniture'
  # 成功案例
  get 'successful_story',             to: 'case#index',           as: 'stories'
  get 'case',                         to: 'case#story',           as: 'case'
  # 代理品牌
  get 'acting_brand',                 to: 'brand#index',          as: 'acting_brand'
  get 'segis',                        to: 'brand#segis',          as: 'segis'
  # 聯絡方式
  get 'contact-information',          to: 'contact#information',  as: 'information'
  get 'contact-recruit',              to: 'contact#recruit',      as: 'recruit'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
