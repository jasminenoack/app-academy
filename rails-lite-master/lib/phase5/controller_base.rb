require_relative '../phase4/controller_base'
require_relative './params'
require_relative '../phase8/flash'
require_relative '../phase10/csrf'


module Phase5
  class ControllerBase < Phase4::ControllerBase
    attr_reader :params, :router

    # setup the controller
    def initialize(req, res, route_params = {}, router = nil)
      @req = req
      @res = res
      @params = Params::new(req, route_params)
      @flash = Flash.new(req, res)
      @csrf = CSRF.new(req, res)
      @router = router
    end
  end
end
