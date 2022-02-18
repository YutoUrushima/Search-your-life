class ApplicationController < ActionController::Base
    include LifesHelper
    include SessionsHelper
    protect_from_forgery with: :exception
end
