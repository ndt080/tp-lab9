import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var isClicked: Bool
    @Binding var selectedAnnotation: MKAnnotation?
    
    let landmarks = LandmarkAnnotation.requestMockData()
    let manager : CLLocationManager = CLLocationManager()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.addAnnotations(landmarks)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate{
        var parent: MapView
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .systemBlue
            renderer.lineWidth = 5
            return renderer
        }
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            self.parent.isClicked = true
            self.parent.selectedAnnotation = view.annotation
            
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotaion: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotaion, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
        
        init(_ parent: MapView){
            self.parent = parent
        }
    }
}

//struct MapView1: UIViewRepresentable {
//    @Binding var manager : CLLocationManager
//    @Binding var alert : Bool
//    let map = MKMapView()
//    let landmarks = LandmarkAnnotation.requestMockData()
//    
//    func makeCoordinator() -> MapViewCoordinator {
//        MapViewCoordinator(self)
//    }
//    
//    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView{
//        MKMapView()
//    }
//    
//    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>){
//        var  coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D()
//        view.showsUserLocation = true
//        self.manager.requestAlwaysAuthorization()
//        self.manager.requestWhenInUseAuthorization()
//        
//        if CLLocationManager.locationServicesEnabled() {
//            self.manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            self.manager.startUpdatingLocation()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
//                let locValue:CLLocationCoordinate2D = self.manager.location!.coordinate
//                print("CURRENT LOCATION = \(locValue.latitude) \(locValue.longitude)")
//                
//                coordinate = CLLocationCoordinate2D(
//                    latitude: locValue.latitude, longitude: locValue.longitude)
//                let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
//                let region = MKCoordinateRegion(center: coordinate, span: span)
//                view.setRegion(region, animated: true)
//            })
//            view.delegate = context.coordinator
//            view.addAnnotations(landmarks)
//        }
//    }
//    func route(_ view: MKMapView){
//        
//        // NYC
//        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.71, longitude: -74))
//        
//        // Boston
//        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.36, longitude: -71.05))
//        
//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark: p1)
//        request.destination = MKMapItem(placemark: p2)
//        request.transportType = .automobile
//        
//        let directions = MKDirections(request: request)
//        directions.calculate { response, error in
//            guard let route = response?.routes.first else { return }
//            view.addAnnotations([p1, p2])
//            view.addOverlay(route.polyline)
//            view.setVisibleMapRect(
//                route.polyline.boundingMapRect,
//                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
//                animated: true)
//        }
//    }
//}
//
