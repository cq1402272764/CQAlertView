Pod::Spec.new do |s|
    s.name         = "CQAlertView"
    s.version      = "1.0.2"
    s.summary      = "Alert,自定义消息内容"
    s.homepage     = "https://github.com/cq1402272764/CQAlertView"
    s.authors      = {"CQ_ Develop" => "1402272764@qq.com"}
    s.platform     = :ios, "7.0"
    s.license      = "MIT"
    s.source       = {:git => "https://github.com/cq1402272764/CQAlertView.git", :tag => s.version.to_s }
    s.source_files = "CQAlertView/**/*.{h,m}"
    s.requires_arc = true
end
