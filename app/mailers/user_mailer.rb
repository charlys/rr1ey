class UserMailer < ActionMailer::Base
  default from: "intelcohm@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/login"
    mail(:to => user.email, :subject => "Welcome to My Site")
  end
  
  
  def send_email(user ,mail_subject)
	@user = user
	@mail_subject = mail_subject
	@patients = User.find(@user.id) #Patient.all
    @url  = "http://localhost:3000/login"
	attachments['logoinub2.jpg'] = File.read("#{Rails.root.to_s + '/app/assets/images/logoinub2.jpg'}")
	
	#attachments.inline['logo'] = {:data => File.read("#{Rails.root.to_s + '/app/assets/images/logoinub2.JPG'}"), :mime_type => "image/jpg", :encoding => "7bit"}
	
    mail(	:to => user.email, :bcc => ["charly613@gmail.com", "CSA <charly613@gmail.com>"], :subject => @mail_subject)
  end
  
  def send_appointemail(patient, user ,mail_subject)
	@patient = Patient.find(patient)
	@user = user
	@mail_subject = mail_subject
	@appointments = Appointment.where("patient_id = "+patient) 
    @url  = "http://localhost:3000/login"
	attachments['logoinub2.jpg'] = File.read("#{Rails.root.to_s + '/app/assets/images/logoinub2.jpg'}")
	
	#attachments.inline['logo'] = {:data => File.read("#{Rails.root.to_s + '/app/assets/images/logoinub2.JPG'}"), :mime_type => "image/jpg", :encoding => "7bit"}
	
    mail(	:to => user.email, :bcc => ["charly613@gmail.com", "CSA <charly613@gmail.com>"], :subject => @mail_subject)
  end

  end
