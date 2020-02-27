class AllocationMailer < ApplicationMailer
    default from: '<email>'
 
  def allocated_patient_mail
    @user = params[:user]
    @patient = params[:patient]
    @url  = '/'
    mail(to: @user.email,
         subject: 'Patient Allocation'
        )
  end
end
