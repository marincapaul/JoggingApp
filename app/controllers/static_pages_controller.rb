class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @run = current_user.runs.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end



  def filter
    if logged_in?
      @run = current_user.runs.build
      opt ={}
      opt[:from] = params[:from]
      opt[:to] = params[:to]
      @feed_items = current_user.feed(opt).paginate(page: params[:page])
      
      respond_to do |format|
        format.html { render 'home' }
        format.js
      end

    end
  end

end
