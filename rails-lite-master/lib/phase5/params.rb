require 'uri'

module Phase5
  class Params

    class AttributeNotFoundError < ArgumentError; end;
    # use your initialize to merge params from
    # 1. query string
    # 2. post body
    # 3. route params
    #
    # You haven't done routing yet; but assume route params will be
    # passed in as a hash to `Params.new` as below:
    def initialize(req, route_params = {})
      @params = parse_www_encoded_form(req.query_string)
      @params.merge!(parse_www_encoded_form(req.body))
      @params.merge!route_params
    end

    def [](key)
      key = key.to_s
      @params[key]
    end

    def to_s
      @params.to_json.to_s
    end



    private
    # this should return deeply nested hash
    # argument format
    # user[address][street]=main&user[address][zip]=89436
    # should return
    # { "user" => { "address" => { "street" => "main", "zip" => "89436" } } }
    def parse_www_encoded_form(www_encoded_form)
      return {} if www_encoded_form.nil?
      decoded = URI::decode_www_form(www_encoded_form)
      params={}

      decoded.map do |key, value|

        nested_keys = Hash.new
        inner_hash = nested_keys

        key_values = parse_key(key)

        nested_hash = {key_values[0] => ""}
        inner_hash = nested_hash
        last_key = key_values[0]

        key_values[1..-1].each_with_index do |key_value, index|
          inner_hash[last_key] = {key_value => ""}
          inner_hash = inner_hash[last_key]
          last_key = key_value
        end

        inner_hash[last_key] = value

        params = merge(params, nested_hash)
      end
      params
    end

    # this should return an array
    # user[address][street] should return ['user', 'address', 'street']
    def parse_key(key)
      key.split(/\]\[|\[|\]/).reject(&:empty?)
    end

    def merge(hash1, hash2)
      new_hash1 = hash1
      new_hash2 = hash2

      until new_hash1.keys.first != new_hash2.keys.first
        new_hash1 = new_hash1[new_hash2.keys.first]
        new_hash2 = new_hash2[new_hash2.keys.first]
      end

      new_hash1.merge!(new_hash2)
      hash1
    end
  end
end
