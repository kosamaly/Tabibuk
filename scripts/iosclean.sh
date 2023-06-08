#!/bin/sh
echo "========== Cleanup start =========="
rm -Rf ios/Pods
rm -Rf ios/.symlink
rm -Rf ios/Flutter/Flutter.framework
rm -Rf ios/Flutter/Flutter.podspec
rm -Rf ios/Podfile.lock
rm -Rf ~/Library/Developer/Xcode/DerivedData/* -y
flutter clean
flutter packages get
cd ios
pod install
pod update
cd ..

echo "========== Cleanup end =========="
echo "Suggest you to restart your xcode"
echo "========== Have a nice day =========="
