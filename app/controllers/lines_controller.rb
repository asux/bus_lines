# frozen_string_literal: true

class LinesController < ApplicationController
  def index
    @lines = Line.all
    render :index
  end
end
