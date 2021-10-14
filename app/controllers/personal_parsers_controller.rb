class PersonalParsersController < ApplicationController
  def index
    @parsers = PersonalParser.all
  end
end
