Pod::Spec.new do |spec|
spec.name = "CustomModalTransition"
spec.version = "1.0.0"
spec.summary = "Custom modal transition framework"
spec.homepage = "https://github.com/llodi/CustomModalTransition"
spec.license = { type: 'MIT', file: 'LICENSE' }
spec.authors = { "Ilya Dolgopolov" => 'val-idol@yandex.ru' }
spec.social_media_url = "http://twitter.com/lllodi"

spec.platform = :ios, "8.0"
spec.requires_arc = true
spec.source = { git: "https://github.com/llodi/CustomModalTransition.git", tag: "v#{spec.version}", submodules: true }
spec.source_files = "CustomModalTransition/**/*.{h,swift}"

end