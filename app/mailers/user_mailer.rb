class UserMailer < ApplicationMailer
    default from: 'Search your life'
    
    def welcome_email
        @life = params[:life]
        @url = 'http://example.com/login'
        mail(to: @life.email, subject: 'Search your lifeに登録いただきありがとうございます。')
    end
end
