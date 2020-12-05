module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    puts response.body
    JSON.parse(response.body)
  end
end