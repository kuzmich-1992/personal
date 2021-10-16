# frozen_string_literal: true

class EntitiesController < ApplicationController
  before_action :load_entities
  respond_to :xlsx
  
  def index
    @entities = Entity.order('created_at DESC') 
  end

  def new
    @entity = Entity.new
  end

  def create
    arr=[]
    @parsed_url = permitted_parameters[:parsed_url]
    @file = permitted_parameters[:numbers]
    workbook = SimpleXlsxReader.open @file.tempfile.to_path.to_s
    worksheets = workbook.sheets
    worksheets.map{|el| arr.push(el.rows)}
    @doc = Nokogiri::HTML(URI.open(@parsed_url))
    @info = @doc.css('col-md', 'p').map{|link| link.content}
    Axlsx::Package.new do |p|
      p.workbook.add_worksheet(:name => "Pie Chart") do |sheet|
        sheet.add_row [arr.first]
      end
      p.serialize('simple.xlsx')
      send_file "#{Rails.root}/simple.xlsx", type: "application/xlsx", x_sendfile: true
    end 
  end
  
  # @entity = Entity.new(permitted_parameters.merge!({:parsed_info => @info})
  #                                          .merge({:parsed_url => 'https://axela-app.herokuapp.com/adposts/'}))
  # if @entity.save
  #   redirect_to entities_path
  # else
  #   render :new
  # end

  protected

  def load_entities
    @entities = Entity.all
    @entity = Entity.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:entity).permit(:numbers, :parsed_info, :parsed_url)
  end
end

