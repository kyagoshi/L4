class TopController < ApplicationController
    def main
        if session[:uid].nil?
            render 'main'
        else
            render 'login'
        end
    end

    def login
        @user = User.all
        @user.length.times do |i|
            if params[:uid] == @user[i].uid and params[:pass] == @user[i].pass
                session[:uid] = params[:uid]
                flash[:notice] = "ログイン成功！"
                redirect_to '/'
            end
        end
        if session[:uid].nil?
            render 'error'
        end
    end

    def logout
        session.delete(:uid)
        redirect_to '/'
    end

end
