class UsersController < ApplicationController
	 def create
      @new_user_info = params.require(:cat).permit(:name, :email, :password)
      @user = User.new(@new_user_info)
	      if @user.save
	        redirect_to (root)
	      else
	        render 'new'
    	  end
    end

    def new 
    	@user = User.new
    end

  end
end
