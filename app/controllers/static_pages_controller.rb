class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @run = current_user.runs.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def report
    if logged_in?
      @results = current_user.report
    end
  end

  def filter
    if logged_in?
      @run = current_user.runs.build
      opt ={}
      opt[:from] = params[:from]
      opt[:to] = params[:to]
      @feed_items = current_user.feed(opt).paginate(page: params[:page])
      render 'home'
    end
  end

end
