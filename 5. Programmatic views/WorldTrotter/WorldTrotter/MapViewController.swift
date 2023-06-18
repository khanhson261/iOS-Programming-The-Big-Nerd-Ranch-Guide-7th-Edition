//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Khanh Son on 6/17/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        mapView.pointOfInterestFilter = .excludingAll
        view = mapView
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.addTarget(self,
                                   action: #selector(mapTypeChanged(_:)),
                                   for: .valueChanged)
        
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let segmentTopConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                                  constant: 8)
        let segmentCenterXConstraint = segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        segmentTopConstraint.isActive = true
        segmentCenterXConstraint.isActive = true
        
        let label = UILabel()
        label.text = "Point of interest"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let labelTopConstraint = label.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 12)
        let labelLeadingConstraint = label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
        labelTopConstraint.isActive = true
        labelLeadingConstraint.isActive = true
        
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(pointOfInterestToggle(_:)), for: .valueChanged)
        view.addSubview(switchControl)

        let switchLeadingConstraint = switchControl.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8)
        let switchTopConstraint = switchControl.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        switchLeadingConstraint.isActive = true
        switchTopConstraint.isActive = true
    }
    
    @objc func mapTypeChanged(_ segmentControl: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break }
    }
    
    @objc func pointOfInterestToggle(_ switchControl: UISwitch) {
        if switchControl.isOn {
            mapView.pointOfInterestFilter = .includingAll
        } else {
            mapView.pointOfInterestFilter = .excludingAll
        }
    }
    
}

