class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues
    

    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def show
    venue_id = params.fetch("an_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.at(0)

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    
    venue_address = params.fetch("query_address")
    venue_name = params.fetch("query_name")
    venue_neighborhood = params.fetch("query_neighborhood")
    
    create_venue = Venue.new
 
    create_venue.address = venue_address
    create_venue.name = venue_name
    create_venue.neighborhood = venue_neighborhood

    create_venue.save

    redirect_to("/venues/#{create_venue.id}")
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

end
