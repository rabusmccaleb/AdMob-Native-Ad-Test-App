# AdMob-Native-Ad-Test-App

## About :

_This repo is an example app to show others how to integrate native ads into their IOS appliction. This can sometimes be confusing for Devs. So Here is an example to use.
It also helps to use this Admob's Documentation :_ https://developers.google.com/admob/ios/native/advanced

Here is a screen shot of what it looks like : 
<p align="center">
<img src="https://user-images.githubusercontent.com/69118018/169628309-0bcecf26-ee14-464d-8ad1-33fb777ecc52.png" width="500">
</p>


#### App Delegate :

Import :
`import GoogleMobileAds`

In this App Delegate function: ` func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool`

Add : 
`
        GADMobileAds.sharedInstance().start(completionHandler: nil)
`

#### In your Info PList File :
<p align="center">
<img width="500" alt="Screen Shot 2022-05-20 at 8 12 40 PM" src="https://user-images.githubusercontent.com/69118018/169628751-4733f76d-d1ea-4a82-996a-f3a4e98c69c8.png">
</p>

Which can be found : 
https://developers.google.com/admob/ios/quick-start


#### Using Storyboard :
If you want to user storyboard for styling and object placement these are two things you probably should know :

1.  Your Entire Native Ad has to be embedded in a UIView and this view has to conform to the `GADNativeAdView` class otherwise it will not work
See the screen shot below to see how and where to add that in Xcode :
<p align="center">
<img width="258" alt="Screen Shot 2022-05-20 at 8 15 46 PM" src="https://user-images.githubusercontent.com/69118018/169628943-6dcb883c-cecb-4539-88ad-ab56b2f9638a.png">
</p>

2. Your also needs Media View needs to conform a class in this class has to be `GADMediaView`. The process is the same as the one above see screenshot below:
<p align="center">
<img width="261" alt="Screen Shot 2022-05-20 at 8 22 46 PM" src="https://user-images.githubusercontent.com/69118018/169629073-506331b0-0730-4f71-80bf-3d698e1cb858.png">
</p>


If your a custom to swift everything else works as normal. Everything else should be able to be understood by looking at the ViewController file :

