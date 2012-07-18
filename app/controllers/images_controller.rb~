class ImagesController < ApplicationController
 def new
    @image  = Image.new
  end


  def create
    @image         = Image.new( params[:image] )

    @image.save!

    flash[:notice] = "Successfully created image."
    render :action => 'new'
  rescue => e
    logger.error( "Upload failed.  #{e}" )
    flash[:error] = 'Upload failed. Please try again.'
    render :action => 'new'
  end
end
