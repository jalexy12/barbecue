class BarbecuesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :index]

  def index
    @barbecues = Barbecue.order(:date)
  end

  def new
    @bbq = Barbecue.new
  end

  def create
    bbq_params = params.require(:barbecue).permit(:title, :venue, :date)
    @bbq = Barbecue.new(bbq_params)

    unless @bbq.save
      render(:new)
    else
      redirect_to(barbecues_path)
    end
  end


  def authenticate
    user_login = params.require(:user).permit(:email, :password)
    user = User.find_by(email: user_login[:email]).try(:authenticate, user_login[:password])
    

    if !user
      @user = User.new(email: user_login[:email])
      render ('login')
    else
      session[:id] = user.id
      redirect_to(root)
    end

  end

  def show 
   
  end

  def join
      barbecue = Barbecue.where("id = #{params[:id]}").first
        barbecue.users.push(current_user)
      render(json: barbecue)
  end

  def showbbq
       if barbecue = Barbecue.where("id = #{params[:id]}").first
        render(json: barbecue.to_json(:include => :users ))
      else
        render :json => {type: "not-found", message: "There is no BBQ by this ID"}, :status => 404
      end

  end

  private

end
