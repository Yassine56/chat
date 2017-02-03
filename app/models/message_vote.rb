class MessageVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :message,
           foreign_key: "mailboxer_notifications_id", dependent: :destroy,
           class_name: "Mailboxer::Notification"
end
