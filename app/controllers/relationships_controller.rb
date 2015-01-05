class RelationshipsController < ApplicationController
  def create
  	Relationship.create(params[:relationship])
  	redirect_to root_path
  end

  def new
  end

  def destroy
  	redirect_to root_path
  end
end
