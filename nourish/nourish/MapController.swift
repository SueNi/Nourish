//
//  MapController.swift
//  nourish
//
//  Created by Safiyah Lakhany on 7/17/19.
//  Copyright © 2019 Safiyah Lakhany. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController
{

    @IBOutlet weak var Map: MKMapView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var location = CLLocationCoordinate2D(latitude: 34.106053, longitude: -117.709770)
        
        var annotation = MKPointAnnotation()
        var span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        var region = MKCoordinateRegion(center: location, span: span)
        
        Map.setRegion(region, animated: true)
        annotation.coordinate = location
        annotation.title = "The Cafe"
        annotation.subtitle = "Harvey Mudd College"
        Map.addAnnotation(annotation)
        
        
        
        // Do any additional setup after loading the view.
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
