module Mrcr
  module Helpers
    module RedisConfig
      class << self
        def combine(config={})
          { :host => _host,
            :port => _port,
            :db => 0,
            :use_ssl => _ssl,
            :password => _password,
            :namespace => _namespace,
            :pool_size => _pool_size,
            :expires_in => 1.day }.merge(config)
        end

        def _host
          ENV['REDIS_HOST'] || 'localhost'
        end

        def _port
          ENV['REDIS_PORT'] || '6379'
        end

        def _ssl
          (ENV['REDIS_SSL'] == 'true' ? true : false)
        end

        def _password
          ENV['REDIS_KEY'] || nil
        end

        def _pool_size
          ENV['POOL'] || 5
        end

        def _namespace
          -> { "#{ENV['REDIS_PREFIX'] || '_mrcr-sites'}:#{Rails.env.to_s}" }
        end
      end
    end
  end
end
