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
            flash[:notice] = session[:uid]
            redirect_to '/'
        else
            render 'error'
        end
    end

end
