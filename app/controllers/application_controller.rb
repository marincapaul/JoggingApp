class ApplicationController < ActionController::Base


    def hello
        render html:"hello again"
    end
end
