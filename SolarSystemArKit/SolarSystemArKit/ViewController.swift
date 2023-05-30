//
//  ViewController.swift
//  SolarSystemArKit
//
//  Created by Kadir Aydınlı on 26.12.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        /*let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let soilMaterial = SCNMaterial()
        soilMaterial.diffuse.contents = UIImage(named: "art.scnassets/soil.jpg")
        
        let boxMaterial2 = SCNMaterial()
        boxMaterial2.diffuse.contents = UIImage(named: "art.scnassets/wood.jpg")
        
        let boxMaterial3 = SCNMaterial()
        boxMaterial3.diffuse.contents = UIImage(named: "art.scnassets/grass.png")
        
        let boxMaterial4 = SCNMaterial()
        boxMaterial4.diffuse.contents = UIImage(named: "art.scnassets/wall.png")
        
        let dirtMaterial = SCNMaterial()
        dirtMaterial.diffuse.contents = UIImage(named: "art.scnassets/dirt.png")
        
        let mossMaterial = SCNMaterial()
        mossMaterial.diffuse.contents = UIImage(named: "art.scnassets/moss.png")
        
        myBox.materials = [
            soilMaterial,
            soilMaterial,
            soilMaterial,
            soilMaterial,
            mossMaterial,
            dirtMaterial,
        ]
        
        let node = SCNNode()
        node.position = SCNVector3(0, -0.1, -0.3)
        node.geometry = myBox
        
        sceneView.scene.rootNode.addChildNode(node)*/
        
        let moon = createPhere(radius: 0.04, content: "moon.jpeg", vector: SCNVector3(x: -0.15, y: 0.2, z: -1))
        let world = createPhere(radius: 0.1, content: "world.jpeg", vector: SCNVector3(x: 0, y: 0.2, z: -1))
        let mars = createPhere(radius: 0.2, content: "mars.jpeg", vector: SCNVector3(x: 0.35, y: 0.2, z: -1))
        let jupiter = createPhere(radius: 0.3, content: "jupiter.jpeg", vector: SCNVector3(x: 1, y: 0.2, z: -1))
        let mercury = createPhere(radius: 0.03, content: "mercury.jpeg", vector: SCNVector3(x: -0.25, y: 0.2, z: -1))
        let neptune = createPhere(radius: 0.02, content: "mercury.jpeg", vector: SCNVector3(x: -0.4, y: 0.2, z: -1))
        let saturn = createPhere(radius: 0.2, content: "saturn.jpeg", vector: SCNVector3(x: -0.5, y: 0.2, z: -1))
        let sun = createPhere(radius: 1, content: "sun.jpeg", vector: SCNVector3(x: 3, y: 0.2, z: -1))
        let uranus = createPhere(radius: 0.1, content: "uranus.jpeg", vector: SCNVector3(x: -0.6, y: 0.2, z: -1))
        let venus = createPhere(radius: 0.6, content: "venus.jpeg", vector: SCNVector3(x: -1, y: 0.2, z: -1))
        
        sceneView.scene.rootNode.addChildNode(uranus)
        sceneView.scene.rootNode.addChildNode(neptune)
        sceneView.scene.rootNode.addChildNode(saturn)
        sceneView.scene.rootNode.addChildNode(mercury)
        sceneView.scene.rootNode.addChildNode(moon)
        sceneView.scene.rootNode.addChildNode(world)
        sceneView.scene.rootNode.addChildNode(mars)
        sceneView.scene.rootNode.addChildNode(jupiter)
        sceneView.scene.rootNode.addChildNode(sun)
        
        sceneView.automaticallyUpdatesLighting = true
    }
    
    func createPhere(radius: CGFloat, content: String, vector: SCNVector3) -> SCNNode {
        let myPhere = SCNSphere(radius: radius)
        
        let phereMaterial = SCNMaterial()
        phereMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        
        myPhere.materials = [phereMaterial]
        
        let node = SCNNode()
        node.position = vector
        node.geometry = myPhere
        
        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
