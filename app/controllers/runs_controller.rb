class RunsController < ApplicationController
    before_action :logged_in_user, only: [:create, :update, :edit]
    before_action :correct_user, only: [:destroy, :update, :edit]
    # before_action :admin_user, only: [:destroy]
    
    def create
        @run = current_user.runs.build(run_params)
        if @run.save
            flash[:success] = "Run created!"
            redirect_to root_url
        else
            @feed_items = current_user.feed.paginate(page: params[:page])
            render 'static_pages/home'
        end
    end

    def destroy
        Run.find(params[:id]).destroy
        flash[:success] = "Run deleted"
        redirect_to request.referrer  || root_url
    end

    def edit
        @run = Run.find(params[:id])
        #redirect_to request.referrer || root_url
    end
        
    def update
        @run = Run.find(params[:id])
        if @run.update(run_params)
          flash[:success] = "Run updated"
          redirect_to @run.user
        else
          render 'edit'
        end
    end

    # def show
    #     @run = Run.find(params[:id])
    # end

    private
        def run_params
            params.require(:run).permit(:distance, :time)
        end

        def correct_user
            @run = current_user.runs.find_by(id: params[:id])
            redirect_to root_url unless !@run.nil? || current_user.admin?
        end


            
end
