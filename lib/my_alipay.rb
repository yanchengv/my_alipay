require 'my_alipay/version'
require 'my_alipay/utils'
require 'my_alipay/wap/sign'
require 'my_alipay/wap/service'
require 'my_alipay/wap/notify'
require 'my_alipay/wap/test'

module MyAlipay
  @debug_mode = true
  @sign_type = 'RSA2'

  class << self
    attr_accessor :app_id,:app_private_key, :alipay_public_key, :sign_type, :debug_mode,:gateway_url

    def debug_mode?
      !!@debug_mode
    end
  end
end