class NoticeMailer < ApplicationMailer
  default from: 'manager@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.notice_deadline.subject
  #
  def send_notice_deadline
    @product = params[:product]
    mail(
      subject: '期限',
      to: @product.user.email,
      from: 'task@example.com'
      )
  end
end
