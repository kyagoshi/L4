class TopController < ApplicationController
    def main
        if session[:uid].nil?
            render 'main'
        else
            render 'login'
        end
    end

    def login
        if params[:uid] == "kindai" and params[:pass] == "sanriko"
            session[:uid] = params[:uid]
            redirect_to '/'
        else
            render 'error'
        end
    end

    def logout
        session.delete(:uid)
        redirect_to '/'
    end

end
