namespace :deadline_mail do
  desc "期限の３日前になるとメールを送信する"
  task notice_deadline: :environment do
    time_range = (Time.now.midnight + 3.day)
    products = Product.where('deadline' => time_range)
      products.each do |product|
        NoticeMailer.with(product: product).send_notice_deadline.deliver_now
      end
  end
end

