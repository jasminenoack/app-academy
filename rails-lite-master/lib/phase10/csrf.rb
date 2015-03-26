class CSRF

  def initialize(req, res)
    @req = req
    @res = res
    @token = self.class.create_token
  end

  def self.create_token
    SecureRandom::urlsafe_base64
  end

  def token
    @token
  end

  def token_value
    @token
  end

  def form_token
    @token
  end

  def make_cookie
    @res.cookies << WEBrick::Cookie.new("csrf", {"token" => @token}.to_json)
  end

  def check_token(form_token)
    @cookie_token == form_token
  end

  def get_cookie_token
    cookie = @req.cookies.select { |cookie| cookie.name == 'csrf'}.first
    value = JSON.parse(cookie.value) unless cookie.nil?
    @cookie_token = @value["token"]
  end

end
