//
//  TopTenViewController.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 6/12/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import UIKit
import MapKit

class TopTenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var allScores = [ScoreDetails]()
    let cellReuseIdentifier = "score_cell"
    var newCamera: MKMapCamera!

    @IBOutlet weak var TABLE_tabel: UITableView!
    @IBOutlet weak var MAP_map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MAP_map.showsUserLocation = true
        allScores = Storage.fetch()
        setMapPoints()
        TABLE_tabel.delegate = self
        TABLE_tabel.dataSource = self
    }
    
    func setMapPoints(){
        for score in allScores{
            let point = MKPointAnnotation()
            point.coordinate = CLLocationCoordinate2DMake(Double(score.location.lat!) ,Double(score.location.lng!))
            point.title = score.name
            MAP_map.addAnnotation(point)
        }
    }
    
    func showPoint(index : Int){
        newCamera = MKMapCamera(lookingAtCenter: CLLocationCoordinate2D(latitude: allScores[index].location.lat!, longitude: allScores[index].location.lng!), fromDistance: 30000, pitch: 0.0, heading: 0.0)
        self.MAP_map.setCamera(newCamera, animated: true)
    }
    
    
    @IBAction func onReturnPressed(_ sender: UIButton) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.allScores.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       var cell : Cell? = self.TABLE_tabel.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? Cell
        cell?.LBL_score?.text = String(self.allScores[indexPath.row].time)
        cell?.LBL_name?.text = String(self.allScores[indexPath.row].name).lowercased()
        cell?.LBL_date.text = TimeDateUtil.myDateFormat(date: self.allScores[indexPath.row].date)
        if(cell == nil){
            cell = Cell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellReuseIdentifier)
        }
        return cell!
   }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       showPoint(index: indexPath.row)
   }

}
