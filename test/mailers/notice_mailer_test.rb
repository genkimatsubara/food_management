require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "notice_deadline" do
    mail = NoticeMailer.notice_deadline
    assert_equal "Notice deadline", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
