# frozen_string_literal: true

class PersonalParsersController < ApplicationController
  before_action :load_entities

  def index
    @parsers = PersonalParser.all
  end

  def new
    @parser = PersonalParser.new
  end

  def create
    @parser = PersonalParser.new permitted_parameters

    if @parser.save
      redirect_to personal_parsers_path
    else
      render :new
    end
  end

  protected

  def load_entities
    @parsers = PersonalParser.all
    @parser = PersonalParser.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:personal_parser).permit(:name, :parsed_url, :parsed_info)
  end
end

