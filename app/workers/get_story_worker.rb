require 'logger'
class GetStoryWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :external_api
  def perform
    # TBD
  end
end