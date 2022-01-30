class ApplicationController < ActionController::Base
    include SessionsHelper
    protect_from_forgery with: :exception
    before_action :set_current_user
    before_action :current_time
    
    def the_time
        # 現在時刻のyyyymmdd
        @fomatted_time = @current_time.to_formatted_s(:number).slice!(0...8)
    end
    
    private
        def set_current_user
            @current_user = session[:current_user]
        end
        
        def current_time
            Time.zone = "Asia/Tokyo"
            @current_time = Time.zone.now
        end
end
