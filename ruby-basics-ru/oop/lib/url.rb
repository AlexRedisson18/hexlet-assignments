# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  include Comparable
  extend Forwardable

  def_delegators :@uri, :scheme, :host, :port

  def initialize(uri)
    @uri = URI.parse(uri)
    query = @uri.query || ''
    @params = query
              .split('&')
              .each_with_object({}) do |query_pairs, acc|
                key, value = query_pairs.split('=')
                acc[key.to_sym] = value
              end
  end

  def query_params
    @params
  end

  def query_param(key, default_value = nil)
    @params.fetch(key, default_value)
  end

  def <=>(other)
    [scheme, host, port, query_params] <=> [other.scheme, other.host, other.port, other.query_params]
  end
end
# END

# yandex_url = Url.new 'http://yandex.ru?key=value&key2=value2'
# p yandex_url.host # yandex.ru
# p yandex_url.scheme # http
# p yandex_url.query_params # { key: 'value', key2: 'value2' }
# p yandex_url.query_param(:key) # 'value'
# p yandex_url.query_param(:key2, 'lala') # 'value2'
# p yandex_url.query_param(:new, 'ehu') # 'ehu'
# p yandex_url.query_param(:lalala) # nil
# p yandex_url.query_param(:lalala, 'default') # 'default'

# google_url = Url.new 'https://google.com:80?a=b&c=d&lala=value'
# p yandex_url == google_url # false

# yandex_url_same = Url.new 'http://yandex.ru?key2=value2&key=value'
# p yandex_url == yandex_url_same # true
