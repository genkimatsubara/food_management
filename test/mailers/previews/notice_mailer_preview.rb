# Preview all emails at http://localhost:3000/rails/mailers/notice_mailer
class NoticeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notice_mailer/send_notice_deadline
  def send_notice_deadline
    NoticeMailer.send_notice_deadline
  end

end
