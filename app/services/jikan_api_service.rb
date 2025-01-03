class JikanApiService
  include HTTParty
  base_uri "https://api.jikan.moe"

  def initialize
    @options = {
      headers: {
        'Content-Type' => 'application/json'
      }
    }
  end

  def fetch_data(endpoint, params ={})
    response = self.class.get(endpoint, @options.merge(query: params))
    handle_response(response)
  end

  private

  def handle_response(response)
    case response.code
    when 200
      JSON.parse(response.body)
    when 404
      raise "Resource not found"
    when 429
      raise "Rate limit exceeded"
    else
      raise "Unexpected error: #{response.code}"
    end
  end
end
