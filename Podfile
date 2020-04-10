workspace 'FrameworkiOS'

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def general_pods
  pod 'SnapKit'
end

target 'CoreImageFilter' do
  # Pods for CoreImageFilter
  general_pods
  project 'CoreImageFilter/CoreImageFilter.xcodeproj'
end

target 'SpeechExample' do
  # Pods for SpeechExample
  general_pods
  project 'SpeechExample/SpeechExample.xcodeproj'
end

target 'KitDynamic' do
  # Pods for SpeechExample
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  general_pods
  project 'KitDynamic/KitDynamic.xcodeproj'
end
