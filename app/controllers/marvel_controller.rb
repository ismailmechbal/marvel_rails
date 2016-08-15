class MarvelController < ApplicationController

  def index
    @character = Marvel.new.get_character
  end

  def show
    @story = Marvel.new.get_story
    #GetStoryWorker.perform_async #TBD {Use sidekiq for this job}
  end

end