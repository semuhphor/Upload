class Image < ActiveRecord::Base
   belongs_to :binary


   validates_presence_of( :upload )

   attr_accessor :upload

  def after_updload( model, file)
    puts "^^^^^^^^^^^^^^^^^^^^^^ #{file.path}  uploaded!"
  end
  def name
  end
 end
