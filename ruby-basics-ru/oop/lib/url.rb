# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  extend Forwardable
  include Comparable

  def initialize(url)
    @url = URI(url)
  end

  def_delegators :@url, :scheme, :host, :port

  def query_params
    query_as_hash(@url.query)
  end

  def query_param(key, value = nil)
    query = query_as_hash(@url.query)
    query.key?(key) ? query[key] : value
  end

  def ==(other)
    (@url.host == other.host && @url.scheme == other.scheme) &&
      (@url.port == other.port && query_params == other.query_params)
  end

  private

  def query_as_hash(query)
    return '' unless query

    query.split('&').each_with_object({}) do |elem, acc|
      key, value = elem.split('=')
      acc.merge!({ key.to_sym => value })
    end.sort.to_h
  end
end
# END
