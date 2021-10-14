# frozen_string_literal: true

class PersonalParsersController < ApplicationController
  def index
    doc = Nokogiri::HTML(URI.open('https://axela-app.herokuapp.com/'))
    doc.css('title').each do |link|
      puts link.content
    end
  end
end
