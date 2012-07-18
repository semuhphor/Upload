class BinaryObserver < ActiveRecord::Observer
  observe :image


  def before_create( model )
    if model.respond_to?( 'before_upload' )
      model.before_upload( model ) rescue raise
    end

    binary = Binary.new.upload( model.upload )

    if model.respond_to?( 'after_upload' )
      model.after_upload( model, binary ) rescue raise
    end

    binary          = binary.store()
    model.binary_id = binary.id
    model.active    = 1
  rescue => e
    #
    # Because we’re raising an exception, Rails will rollback
    # the binary save operation at the database level.
    #
    File.delete( File.join( Rails.root, binary.path ) ) if binary

    #
    # Rethrow any exception that was raised.
    #
    raise e
  end
end
