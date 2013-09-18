class OwnersController < ApplicationController
  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      session[:owner_id] = @owner.id
      redirect_to owner_path(current_user), alert: "Signed up!" 
    else
      render :new
    end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])

    if @owner.update_attributes(owner_params)
      redirect_to owner_path(current_user)
    end
  end

  def destroy
    @owner = Owner.find(params[:id])

    if @owner == current_user
      @owner.destroy
      reset_session
      redirect_to root_path, alert: "Account has been deleted."
    else
        render :edit
    end

  end

  private
  def owner_params
    params.require(:owner).permit(:name, :email, :password, :password_confirmation)
  end

end