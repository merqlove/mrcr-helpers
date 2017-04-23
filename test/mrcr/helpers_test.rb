require 'test_helper'

class Mrcr::HelpersTest < Minitest::Spec
  describe 'AssetsHelper' do
    it 'with https' do
      ENV['ASSETS_HTTPS'] = '1'
      _(true).must_equal Mrcr::Helpers::AssetsHelper.https?
      ENV['ASSETS_HTTPS'] = '0'
      _(false).must_equal Mrcr::Helpers::AssetsHelper.https?
    end

    it 'with_build_url' do
      ENV['ASSETS_ENDPOINT'] = 'some.yandex.ru'
      ENV['ASSETS_HTTPS'] = '0'
      _("http://#{ENV['ASSETS_ENDPOINT']}").must_equal Mrcr::Helpers::AssetsHelper.build_url
    end

    it 'without endpoint' do
      ENV['ASSETS_ENDPOINT'] = nil
      _(false).must_equal Mrcr::Helpers::AssetsHelper.endpoint?
    end

    it 'with endpoint' do
      ENV['ASSETS_ENDPOINT'] = 'some.yandex.ru'
      _(true).must_equal Mrcr::Helpers::AssetsHelper.endpoint?
    end
  end

  describe 'RedisConfig' do
    before do
      klass = Struct.new(:env)
      ::Rails = klass.new('development')

      ENV['REDIS_HOST'] = 'somelocalhost'
      ENV['REDIS_PORT'] = '6375'
      ENV['REDIS_SSL'] = 'true'
      ENV['REDIS_KEY'] = 'some'
      ENV['POOL'] = '25'
    end

    it 'when combine' do
      result = Mrcr::Helpers::RedisConfig.combine({})
      result[:namespace] = result[:namespace].call
      _({
        :host => 'somelocalhost',
        :port => '6375',
        :db => 0,
        :use_ssl => true,
        :password => 'some',
        :namespace => '_mrcr-sites:development',
        :pool_size => '25',
        :expires_in => 1.day
      }).must_equal result
    end
  end
end
