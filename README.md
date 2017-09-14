# MyAlipay

A gem for alipay, support wap api of 2017

支持阿里手机支付2017最新版本的接口

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'my_alipay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install my_alipay

## Configuration


在 ```config/initializers/my_alipay.rb```配置如下信息：

```ruby
MyAlipay.app_id = 'APP_ID'  #APPID即创建应用后生成

MyAlipay.app_private_key = 'APP_PRIVATE_KEY'  #开发者应用私钥，由开发者自己生成

MyAlipay.alipay_public_key = 'ALIPAY_PUBLIC_KEY'  #支付宝公钥，由支付宝生成

MyAlipay.gateway_url = 'URL'   #支付宝网关（固定）,根据个人情况可填写沙箱网关或者正式网关

MyAlipay.sign_type = 'RSA2'  #默认为RSA2  商户生成签名字符串所使用的签名算法类型，目前支持RSA2和RSA，推荐使用RSA2

```

## API


- #### 手机网站支付接口(alipay.trade.wap.pay)

```MyAlipay::Wap::Service.create_alipay_trade_wap_pay_url params```

- #### Example

```ruby

params ={
        return_url: 'return_url',
        notify_url: 'notify_url',
        biz_content: {subject: "商品名称", out_trade_no: "L2017052515281049",total_amount: "10.00"}
    }

url = MyAlipay::Wap::Service.create_alipay_trade_wap_pay_url params


#显示支付页面方式
# 1.跳转到支付页面
redirect_to url 

# 2. 或者在html页面跳转,显示支付页面
window.location.href = url

```


- #### 电脑网站支付接口(alipay.trade.page.pay)

```MyAlipay::Page::Service.create_alipay_trade_page_pay_url params```

- #### Example

```ruby

params ={
        return_url: 'return_url',
        notify_url: 'notify_url',
        biz_content: {subject: "商品名称", out_trade_no: "L2017052515281050",total_amount: "10.00"}
    }

url = MyAlipay::Page::Service.create_alipay_trade_page_pay_url params


#显示支付页面方式
# 1.跳转到支付页面
redirect_to url 

# 2. 或者在html页面跳转,显示支付页面
window.location.href = url

```



- #### 支付宝异步通知验签

- #### Example

```MyAlipay::Notify.verify? params```

```ruby
 def notify
    #验签
    is_verify = MyAlipay::Notify.verify? params
    if is_verify
      #验签成功处理
    else
      #验签失败处理
    end
end
 
   

```


## Contributing

Bug report or pull request are welcome.

