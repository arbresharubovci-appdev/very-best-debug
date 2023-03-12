class VenuesController < ApplicationController

  def index
    matching_venues = venues_url
    venues = matching_venues.ord

    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def show
    venue_id = params.fetch("an_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.at(0)

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    
    venue_address = params.fetch("address")
    create_venue = Venue.new
    venue_name = params.fetch("name")
    venue_neighborhood = params.fetch("neighborhood")
    
    venue.save

    redirect_to("/venues/#{venue.name}")
  end
  
  def update
    the_id = params.fetch("the_id")

    venue = Venue.where({ :id => the_id })
    the_venue = venue.at(0)
    the_venue.address = params.fetch("query_address")
    the_venue.name = params.fetch("query_name")
    the_venue.neighborhood = params.fetch("query_neighborhood")
    the_venue.save
    
    redirect_to("/venues/#{the_venue.id}")
  end

  def destroy
    the_id = params.fetch("id_to_delete")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues.at(0)
    venue.destroy

    redirect_to("/venues")
  end

  # def delete
  #   #Parameters: {"for_delete"=>" 777"}
  #   the_id = params.fetch("for_delete")
  #   matching_photos = Photo.where({ :id => the_id})
  #   the_photo = matching_photos.at(0)
  #   the_photo.destroy
  #   #render({ :template => "photo_templates/delete.html.erb"})
  #   redirect_to("/photos")
  # end

end
