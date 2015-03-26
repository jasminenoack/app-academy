require 'json'
require 'webrick'

module Phase4
  class Session

    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      @req = req
      cookie = @req.cookies.select { |cookie| cookie.name == '_rails_lite_app'}.first
      @value = JSON.parse(cookie.value) unless cookie.nil?
      @value ||= {}
    end

    def [](key)
      @value[key]
    end

    def []=(key, val)
      @value[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      res.cookies << WEBrick::Cookie.new('_rails_lite_app', @value.to_json)
    end
  end
end
