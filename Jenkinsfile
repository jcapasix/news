pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/jcapasix/news.git']]])
            }
        }
        
        stage('Build') {
            steps {
                sh 'xcodebuild -workspace News.xcworkspace -scheme Presentation -destination "platform=iOS Simulator,name=iPhone 12" build'
            }
        }
        
        stage('Test') {
            steps {
                sh 'xcodebuild -workspace News.xcworkspace -scheme Presentation -destination "platform=iOS Simulator,name=iPhone 12" test'
            }
        }
        
        stage('Archive') {
            steps {
                sh 'xcodebuild -workspace News.xcworkspace -scheme Presentation -destination "generic/platform=iOS" archive -archivePath "build/Presentation.xcarchive"'
            }
        }
        
        stage('Publish') {
            steps {
                sh 'xcodebuild -exportArchive -archivePath "build/Presentation.xcarchive" -exportPath "build/Presentation.ipa" -exportOptionsPlist "ExportOptions.plist"'
            }
        }
    }
}
