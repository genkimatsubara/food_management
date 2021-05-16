class NoticeMailer < ApplicationMailer
  default from: 'manager@example.com'
  
  def send_notice_deadline
    @product = params[:product]
    @foods = Food.where('title like ?',"%#{@product.name}%").order("RANDOM()").limit(4)
    mail(
      subject: '期限',
      to: @product.user.email,
      from: 'task@example.com'
      )
  end
end
