//
//  ViewController.swift
//  MapPin03
//
//  Created by D7703_18 on 2017. 9. 19..
//  Copyright © 2017년 D7703_18. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var myMapview: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        zoomToRegion()
        let path = Bundle.main.path(forResource: "ViewPoint2", ofType: "plist")
        //print("path = \(String(describing : path))")
        
        let contenst = NSArray(contentsOfFile : path!)
        //print("contents = \(String(describing : contenst))")
        
        var annotations = [MKPointAnnotation]()
        
        
        if let myItems = contenst{
            for item in myItems {
                let lat = (item as AnyObject).value(forKey: "lat")
                let long = (item as AnyObject).value(forKey: "long")
                let title = (item as AnyObject).value(forKey: "title")
                let subTitle = (item as AnyObject).value(forKey: "subTitle")

                let annotation = MKPointAnnotation()
                
                let myLat = (lat as! NSString).doubleValue
                let myLong = (long as! NSString).doubleValue
                let myTitle = title as! String
                let mySubTitle = subTitle as! String
                annotation.coordinate.latitude = myLat
                annotation.coordinate.longitude = myLong
                annotation.title = myTitle
                annotation.subtitle = mySubTitle
                
                annotations.append(annotation)
                
            }
            
        }else{
            print("contents is nil")
        }
        myMapview.showAnnotations(annotations, animated: true)
        myMapview.addAnnotations(annotations)
    }

    
    func zoomToRegion(){
        let center = CLLocationCoordinate2DMake(35.166197, 129.072594)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center , span)
        
        myMapview.setRegion(region, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

