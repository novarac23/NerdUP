class AddAttachmentNerdToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :nerd
    end
  end

  def self.down
    remove_attachment :posts, :nerd
  end
end
