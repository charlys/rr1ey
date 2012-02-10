class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_filter :only_user_id
  
  def only_user_id
	if user_signed_in? 
		if params[:id]== nil
			param_int = 0
		else
			param_int = Integer(params[:id])
		end
		if (current_user.email != "charly613@gmail.com" and current_user.id != param_int )
			params[:id] = current_user.id
		end
	else
	redirect_to new_user_session_url
	end
  end
  
  def index
 #   if user_signed_in? 
	   if current_user.email == "charly613@gmail.com"
			@users = User.all
			respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @users }
			end
			else
			redirect_to user_url(current_user.id)
		end
#	else
#	redirect_to new_user_session_url
#	end  
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = user.find(params[:id])
	
	@drpcount = @user.patients.count
	if @drpcount == nil 
		@drpcount = 0
	end
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
   
  # GET /users/new
  # GET /users/new.json
  def new
    @user = user.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = user.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = user.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = user.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = user.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
