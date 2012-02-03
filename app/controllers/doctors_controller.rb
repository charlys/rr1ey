class DoctorsController < ApplicationController
  # GET /doctors
  # GET /doctors.json
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
			@doctors = Doctor.all
			respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @doctors }
			end
			else
			redirect_to doctor_url(current_user.id)
		end
#	else
#	redirect_to new_user_session_url
#	end  
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @doctor = Doctor.find(params[:id])
	
	@drpcount = @doctor.patients.count
	if @drpcount == nil 
		@drpcount = 0
	end
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doctor }
    end
  end
  
   
  # GET /doctors/new
  # GET /doctors/new.json
  def new
    @doctor = Doctor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @doctor }
    end
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(params[:doctor])

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render json: @doctor, status: :created, location: @doctor }
      else
        format.html { render action: "new" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /doctors/1
  # PUT /doctors/1.json
  def update
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url }
      format.json { head :ok }
    end
  end
end
