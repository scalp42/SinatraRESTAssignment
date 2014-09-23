class CreateEvents < ActiveRecord::Migration
  def self.up
     create_table :events do |t|
       t.text :data
     end
   end

   def self.down
     drop_table :posts
   end
end
