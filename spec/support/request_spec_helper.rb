# spec/support/request_spec_helper.rb
module RequestSpecHelper
  def base_api_url
    'http://example.com/v1'
  end

  module JsonHelper
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end
end
