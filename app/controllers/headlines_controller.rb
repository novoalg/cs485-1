class HeadlinesController < ApplicationController

  def edit
    @headline = Headline.find(1)
  end

  def update
  end

  def toggle_active
  end

end
