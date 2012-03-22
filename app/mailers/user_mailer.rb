class UserMailer < ActionMailer::Base
  #default from: "distpants@gmail.com"
  default from: "charly613@yahoo.com.mx"
  
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
	#encoded_content = SpecialEncode(File.read("#{Rails.root.to_s + '/app/assets/images/wallpaper2.jpg'}"))
	#attachments['logoinub2.jpg'] = {:mime_type => 'application/x-gzip',
    #                           :encoding => 'SpecialEncoding',
    #                           :content => encoded_content }
	
	#attachments['logoinub2.jpg'] = File.read("#{Rails.root.to_s + '/app/assets/images/wallpaper2.jpg'}")
	
	#attachments.inline['amex.pdf'] = {:data => File.read("#{Rails.root.to_s + '/app/assets/images/amex.pdf'}"), :type => "application/pdf"}
	attachments['amex.pdf'] = File.read("#{Rails.root.to_s + '/app/assets/images/amex.pdf'}")
    mail(	:to => user.email, :bcc => ["intelco2@hotmail.com", "CSA <charly613@gmail.com>"], :subject => @mail_subject)
  end

  end
