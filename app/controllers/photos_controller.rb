class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render ({ :template => "photo_templates/index.html.erb" })
  end

  def show
    url_id = params.fetch("path_id")
    @the_photo = Photo.where({ :id => url_id}).first
    render ({ :template => "photo_templates/show.html.erb" })
  end

  def bye

    the_id = params.fetch("deleted_id")

    the_photo = Photo.where({ :id => the_id }).first

    the_photo.destroy

    # render ({ :template => "photo_templates/bye.html.erb" })

    redirect_to("/photos")
  end
end
