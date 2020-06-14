//
//  MenuViewController.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 6/12/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import UIKit
import CoreLocation

class MenuViewController: UIViewController {

    @IBOutlet weak var BTN_easy: UIButton!
    @IBOutlet weak var BTN_hard: UIButton!
    @IBOutlet weak var BTN_topTen: UIButton!
    var locationManager: CLLocationManager!
    var gameStatus: GameStatus!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStatus = GameStatus()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    @IBAction func onLevelPressed(_ sender: UIButton) {
        gameStatus.set_level(level: sender.titleLabel!.text)
        self.performSegue(withIdentifier: "NameTransition", sender: self)
    }
    
    @IBAction func onTopTenPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "TopTenTransition", sender: self)
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "NameTransition"){
            let vc = segue.destination as! OpenViewController
            vc.gameStatus = gameStatus
        }else if(segue.identifier == "TopTenTransition"){
//            _ = segue.destination as! ScoresController
        }
    
    }
}

extension MenuViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            gameStatus.set_locartion(location: LocationModel(lat:location.coordinate.latitude, lng: location.coordinate.latitude))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error=\(error)")
        gameStatus.set_locartion(location: LocationModel(lat: 0, lng: 0))
    }
}

