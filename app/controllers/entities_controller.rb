# frozen_string_literal: true

class EntitiesController < ApplicationController
  before_action :load_entities

  def index
    @entities = Entity.order('created_at DESC') 
  end

  def new
    @entity = Entity.new
  end

  def create
    @doc = Nokogiri::HTML(URI.open('https://axela-app.herokuapp.com/adposts/'))
    @info = @doc.css('col-md', 'p').map do |link|
      link.content
    end

    @entity = Entity.new(permitted_parameters.merge!({:parsed_info => @info})
                                             .merge({:parsed_url => 'https://axela-app.herokuapp.com/adposts/'}))
    if @entity.save
      redirect_to entities_path
    else
      render :new
    end
  end

  protected

  def load_entities
    @entities = Entity.all
    @entity = Entity.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:entity).permit(:name, :parsed_info, :parsed_url)
  end
end

