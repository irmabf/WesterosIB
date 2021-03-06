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
    var model: House
   
    // Mark: - Inicialization
    //necesito inicializar el modelo House
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = model.name
    }
    //Arreglo para manejar los posibles nil, obligacion de apple
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Una vez que se han terminado de cargar todas mis vistas quiero sincronizar el modelo con la vista
    /*override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
        
    }*/
    // Mark: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
    
    // Mark: - Sync
    func syncModelWithView() {
        //Sincronizo model con view
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
       
        
    }
    // Mark: - UI
    func setupUI() {
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain , target: self , action: #selector(displayWiki) )
        
        let members = UIBarButtonItem(title: "Members", style: .plain, target: self, action: #selector(displayMembers))
        navigationItem.rightBarButtonItems = [wikiButton, members]
    }
    
    @objc func displayWiki() {
        //Creamos el WikiVC
        let wikiViewController = WikiViewController(model: model)
        
        //hacemos push
        navigationController?.pushViewController(wikiViewController, animated:true)
    }
    
    @objc func displayMembers(){
        //Creamos el view controller
        let memberListViewController = MemberListViewController(model: model.sortedMembers)
        //Hacemos push
        navigationController?.pushViewController(memberListViewController, animated: true)
    }
}

extension HouseDetailViewController: HouseListViewControllerDelegate {
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House) {
        //Self model ahora es igual a la house nueva que se ha seleccionado
        self.model = house
        syncModelWithView()
    }
    
    
}










