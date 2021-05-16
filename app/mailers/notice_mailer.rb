class NoticeMailer < ApplicationMailer
  default from: 'manager@example.com'
  
  def send_notice_deadline
    @product = params[:product]
    mail(
      subject: '期限',
      to: @product.user.email,
      from: 'task@example.com'
      )
  end
end
