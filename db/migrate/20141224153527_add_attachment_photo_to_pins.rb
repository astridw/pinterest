class AddAttachmentPhotoToPins < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :pins, :photo
  end
end
