class AddAttachmentPhotoToTrainers < ActiveRecord::Migration
  def self.up
    change_table :trainers do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :trainers, :photo
  end
end
