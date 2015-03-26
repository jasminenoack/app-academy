require 'byebug'
class Flash

  def initialize(req, res)
    @req = req
    @res = res
    cookie = @req.cookies.select { |cookie| cookie.name == 'flash'}.first
    p cookie
    @value = JSON.parse(cookie.value) unless cookie.nil?
    cookie = @req.cookies.select { |cookie| cookie.name == 'flash_unused'}.first
    @unused = JSON.parse(cookie.value) unless cookie.nil?
    check_for_removal
  end

  def [](key)
    return if @value.nil?
    @value[key] || value
  end

  def now(key, value)
    self[key] = value
    cookie = @req.cookies.select { |cookie| cookie.name == 'flash'}.first
    @value = {key => value}
    @res.cookies << create_cookie("unused", false, 'flash_unused')
  end

  def []=(key, val)
    @res.cookies << create_cookie(key, val)
    @res.cookies << create_cookie("unused", true, 'flash_unused')
  end

  def value
    return if @value.nil?
    @value["message"]
  end

  def create_cookie(key, value, message = "flash")
    @cookie = WEBrick::Cookie.new(message, {key => value}.to_json)
    @cookie.path = "/"
    @cookie
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies

  def check_for_removal
    if @value && @unused && @unused["unused"]
      @res.cookies << create_cookie("unused", false, 'flash_unused')
    elsif @value
      @value = nil
      @res.cookies << create_cookie("unused", nil, 'flash_unused')
      @res.cookies << create_cookie("message", nil)
    end
  end

end
