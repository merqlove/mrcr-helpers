require 'open-uri'

module Mrcr
  module Helpers
    module IpHelper
      class << self
        def detect
          open('http://whatismyip.akamai.com').read
        end
      end
    end
  end
end
