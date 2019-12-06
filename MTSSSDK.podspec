

Pod::Spec.new do |s|



s.name         = "MTSSSDK"
s.version      = "1.2.0.0"
s.summary      = "MTSSSDK for 威胁感知"

s.description  = <<-DESC
MTSSSDK for 轻量化威胁感知
DESC

s.homepage     = "http://www.iyuedong.cn"
s.author             = { "infobeat" => "http://www.iyuedong.cn" }
s.platform     = :ios, "8.0"
s.ios.deployment_target = '8.0'

s.source       = { :git => "https://github.com/infobeats/MTSSSDK.git", :tag => s.version }


s.vendored_frameworks = 'SDK/MTSSSecSDK.framework'


end


