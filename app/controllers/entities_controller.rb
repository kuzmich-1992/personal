# frozen_string_literal: true

class EntitiesController < ApplicationController
  before_action :load_entities

  def index
    @entities = Entity.all
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new
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
end

