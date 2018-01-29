class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_post.subject
  #
  def sendmail_post(post)
    @post = post

    mail to: "aris11celestial.exploring@gmail.com",
      subject: '【Facebook DEMO】新規投稿を受け付けました'
  end
end
