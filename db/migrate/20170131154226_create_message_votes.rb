class CreateMessageVotes < ActiveRecord::Migration
  def change
    create_table :message_votes do |t|
      t.belongs_to :user, index: true
      t.boolean :vote
      t.belongs_to :mailboxer_notifications, index: true
      t.timestamps null: false
    end
  end
end
