Pod::Spec.new do |s|
s.name         = "CQAlertView"
s.version      = "1.0.1"
s.summary      = "快速集成警告弹框小控件"
s.homepage     = "https://github.com/cq1402272764/CQAlertView"
s.authors      = {"CQ_ Develop" => "1402272764@qq.com"}
s.platform     = :ios, "7.0"
s.license      = "MIT"
s.source       = {:git => "https://github.com/cq1402272764/CQAlertView.git", :tag => s.version.to_s }
s.source_files = "CQAlertView/CQAlertView/**/*.{h,m}"
s.requires_arc = true
end
