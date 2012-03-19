class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  
  def index
    if (params[:id] == nil and current_user.email == "charly613@gmail.com")
		#@patients = Patient.all
		redirect_to users_url
	else
		@usr = User.find(current_user.id)
		@patients = @usr.patients
	
		respond_to do |format|
		format.html # index.html.erb
		format.json { render json: @patients }
		end
	end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])
	if (@patient.user_id == current_user.id) 
		respond_to do |format|
		format.html # show.html.erb
		format.json { render json: @patient }
		end
	else
		redirect_to :action => 'index'
	end
  end
  
  # GET /patients/new
  # GET /patients/new.json
  def new
	@u = User.find(current_user.id)
	@patient = @u.patients.build
	@patient.save	
    #@patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end
  
  def drp
	if ( current_user.id == Integer(params[:id]) or current_user.email == 'charly613@gmail.com' )
		@usr = User.find(params[:id])
		respond_to do |format|
		format.html # drp.html.erb
		format.json { render json: @patient }
		end
	else
		redirect_to user_url(current_user.id)
		flash[:error] = "You must be logged in to access this section"
	end
  end
  
  def mail_list_objects
	flash[:notice] = 'sending Mail '
  	UserMailer.send_email(current_user , "List Objects").deliver
	#render :text =>  'Sending Mail' # DISPLAY WHITE PAGE WITH MESSAGE
  end
  
  # POST /patients
  # POST /patients.json
  def create
	@usr = Patient.find(params[:id])
	@patient = @usr.patients.build(params[:patient])
	
    #@patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :ok }
    end
  end
 
end
