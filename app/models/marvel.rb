class Marvel
  include HTTParty
  base_uri "gateway.marvel.com:80/v1/public"
  PUBLIC_KEY = "e4e78f2c5dd1d6b1e6adaa5e10f77755"
  PRIVATE_KEY = "ff6602830c5b7263b8824eaa430b7b746b7d6cb5"

  def initialize
    @query = {
      "ts" => ts,
      "apikey" => PUBLIC_KEY,
      "hash" => hash
    }
  end

  def get_character
    characterId = 1009368.to_s     # Iron Man Character ID
    response = self.class.get('/characters/' + characterId,
                              :query => @query,
                              headers: { 'Content-Type' => 'application/json' },
                              format: :json)
    if response.success?
      response.parsed_response["data"]["results"][0]["stories"]
    end
  end

  def get_story
    story_id = 1041.to_s           # Avengers (1998) Story ID
    response = self.class.get('/stories/' + story_id,
                              :query => @query,
                              headers: { 'Content-Type' => 'application/json' },
                              format: :json)
    if response.success?
      response["data"]
    end
  end

  private

  def ts
    Time.now.to_s
  end

  def hash
    Digest::MD5.hexdigest(ts+PRIVATE_KEY+PUBLIC_KEY)
  end

end