class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new_form
  end

  def create_row
    @actor = Actor.new
    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    @actor.save

    render("show")
  end

  def edit_form
    @actor = Actor.find(params[:id])
    # @actor.dob = params[:dob]
    # @actor.name = params[:name]
    # @actor.bio = params[:bio]
    # @actor.image_url = params[:image_url]
    render("actors/edit_form.html.erb")
  end

  def update_row
    the_id = params[:id]
    @actor = Actor.find(the_id)
    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]
#
#     dob2 = params[:dob]
#     name2 = params[:name]
#     bio2 = params[:bio]
#     image_url2 = params[:image_url]
# updated_actor=Actor.find(the_id)
# updated_actor.dob=dob2
# updated_actor.name=name2
# updated_actor.bio=bio2
# updated_actor.image_url=image_url2
# updated_actor.save
    @actor.save

    redirect_to("/actors")
  end

  def destroy
    @actor = Actor.find(params[:id])

    @actor.destroy
  end
end
