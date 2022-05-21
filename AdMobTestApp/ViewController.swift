//
//  ViewController.swift
//  AdMobTestApp
//
//  Created by Clarke Kent on 5/20/22.

import Foundation
import UIKit
import GoogleMobileAds

class  ViewController : UIViewController, GADNativeAdLoaderDelegate, GADVideoControllerDelegate, GADAdLoaderDelegate {
    

    @IBOutlet weak var Headline: UILabel!
    @IBOutlet weak var AdContent : GADMediaView!
    
    @IBOutlet weak var AdInfoText: UILabel!
    
    private var adLoader: GADAdLoader?
    
    @IBOutlet weak var CallToActionButton: UIButton!
    
    @IBOutlet weak var Price: UILabel!
    
    @IBOutlet weak var Store: UILabel!
    
    @IBOutlet weak var Logo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers =
            [ UIDevice.current.identifierForVendor!.uuidString ]
        
        let mediaOptions = GADNativeAdMediaAdLoaderOptions()
        mediaOptions.mediaAspectRatio = .portrait
        
        let videoOptions = GADVideoOptions()
        videoOptions.customControlsRequested = true
        videoOptions.startMuted = true
        adLoader = GADAdLoader(
            adUnitID: "ca-app-pub-3940256099942544/2247696110",
            rootViewController: self,
            adTypes: [GADAdLoaderAdType.native],//[kGADAdLoaderAdTypeNative],
            options: [videoOptions, mediaOptions])
        adLoader?.delegate = self
        adLoader?.load(GADRequest())

    }

    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd){
        
        UIView.transition(
            with: Headline, duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
            self.AdContent?.mediaContent?.videoController.delegate = self
                self.AdContent.mediaContent?.videoController.delegate = self
            self.AdContent.mediaContent = nativeAd.mediaContent
            self.AdContent.mediaContent?.videoController.play()
                self.Headline.text = nativeAd.headline
            self.AdInfoText.text = nativeAd.body
            
            self.CallToActionButton.setTitle(nativeAd.callToAction, for: .normal)
            self.Price.text = nativeAd.price
            self.Store.text = nativeAd.store
            self.Logo.image = nativeAd.icon?.image
            self.AdContent.clipsToBounds = true
                
        })
    }

    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        print("Error Loading Native Ad")
    }

    // GADVideoControllerDelegate methods
    func videoControllerDidPlayVideo(_ videoController: GADVideoController) {
    // Implement this method to receive a notification when the video controller
    // begins playing the ad.
    }

    func videoControllerDidPauseVideo(_ videoController: GADVideoController) {
        // Implement this method to receive a notification when the video controller
        // pauses the ad.
    }

    func videoControllerDidEndVideoPlayback(_ videoController: GADVideoController) {
        // Implement this method to receive a notification when the video controller
        // stops playing the ad.
        adLoader?.load(GADRequest())
        self.dismiss(animated: false, completion: nil)
    }

    func videoControllerDidMuteVideo(_ videoController: GADVideoController) {
        // Implement this method to receive a notification when the video controller
        // mutes the ad.
    }

    func videoControllerDidUnmuteVideo(_ videoController: GADVideoController) {
        // Implement this method to receive a notification when the video controller
        // unmutes the ad.
    }
}


