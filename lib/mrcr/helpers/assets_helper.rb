module Mrcr
  module Helpers
    module AssetsHelper
      class << self
        def build_url
          "http#{'s' if https?}://#{ ENV['ASSETS_ENDPOINT'] }"
        end

        def https?
          ENV['ASSETS_HTTPS'] == '1'
        end

        def endpoint?
          ENV['ASSETS_ENDPOINT'].present?
        end
      end
    end
  end
end
