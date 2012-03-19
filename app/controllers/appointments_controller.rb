class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
  def index
	if (params[:id] == nil and current_user.email == "charly613@gmail.com")
		#@patients = Patient.all
		redirect_to users_url
	else
		@usr = User.find(current_user.id)
		@appointments = @usr.appointments
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @appointments }
		end
	end
  end
  
def papp
		@patient = Patient.find(params[:id])
		respond_to do |format|
		format.html # papp.html.erb
		format.json { render json: @appointment }
		end
end
  
def mail_list_app
	@patient=Patient.find( params[:id] )
	flash[:notice] = 'sending Mail ' + @patient.name
  	UserMailer.send_appointemail( params[:id], current_user , "List Comments").deliver
	#render :text =>  'Sending Mail' # DISPLAY WHITE PAGE WITH MESSAGE
end
  
  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
	@u = User.find(current_user.id)
	@appointment = @u.appointments.build
    @appointment.save 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit

    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(params[:appointment])

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :ok }
    end
  end
end
