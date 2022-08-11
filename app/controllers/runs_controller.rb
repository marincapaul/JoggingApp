class RunsController < ApplicationController
    before_action :logged_in_user, only: [:create, :update, :edit]
    before_action :correct_user, only: [:destroy, :update, :edit]
    # before_action :admin_user, only: [:destroy]
    
    def create
        @run = current_user.runs.build(run_params)
        respond_to do |format|
            if @run.save
                flash.now[:success] = "Run created!" 
                format.html { redirect_to root_url }
                format.js 
                
            else
                @feed_items = current_user.feed.paginate(page: params[:page])
                format.html { render 'static_pages/home' }
                format.js
            end
        end
    end

    def destroy
        Run.find(params[:id]).destroy
        flash.now[:success] = "Run deleted"
        respond_to do |format|
            format.html { redirect_to request.referrer  || root_url }
            format.js
        end
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
