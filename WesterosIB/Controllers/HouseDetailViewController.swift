//
//  HouseDetailViewController.swift
//  WesterosIB
//
//  Created by Irma Blanco on 27/02/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var wordsLabel: UILabel!
    
    //Vistas
  
    //Aquí empiezo a poner mis propiedades, es decir, las que ya no pertenecen a la capa gráfica
    
    //En primer lugar, un HouseDetailViewController, necesita mostar una House, que va a ser un modelo
    
    // Mark: - Propierties
    let model: House
   
    // Mark: - Inicialization
    //necesito inicializar el modelo House
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    //Arreglo para manejar los posibles nil, obligacion de apple
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    //Una vez que se han terminado de cargar todas mis vistas quiero sincronizar el modelo con la vista
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
        
    }
    
    // Mark: - Sync
    func syncModelWithView() {
        //Sincronizo model con view
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
        
    }
}
