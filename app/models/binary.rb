class Binary < ActiveRecord::Base
   has_one :image


   def upload( uploaded_file )
     self.name      = uploaded_file.original_path
     self.mime_type = uploaded_file.content_type

     # get_bin_root() returns File.join( Rails.root, ‘public’, ‘bin’ )
     save_as = File.join( get_bin_root(), '_tmp', uploaded_file.original_path )

     File.open( save_as.to_s, 'w' ) do |file|
       file.write( uploaded_file.read )
     end

     self.extension = File.extname( self.name ).sub( /^\./, '' ).downcase
     self.size      = File.size( save_as )
     self.path      = save_as.sub( Rails.root.to_s + '/', '' )
     self.uri       = get_uri_from_path()

     self.save!

     return self
   end
 end
