//
//  MemberListViewController.swift
//  WesterosIB
//
//  Created by Irma Blanco on 28/02/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {
    
    // Mark: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // Mark: - Properties
    var model: [Person]
    
    // Mark: - Initialization
    init(model: [Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asignamos delegado
        tableView.delegate = self
        //Asignamos la fuente de datos
        tableView.dataSource = self
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Nos damos de alta en las notificaciones
        let noticationCenter = NotificationCenter.default
        noticationCenter.addObserver(self,selector:#selector(self.houseDidChange),name:Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME),object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Nos damos de baja en las notificationes
        let noticationCenter = NotificationCenter.default
        noticationCenter.removeObserver(self)
    }
    
    @objc func houseDidChange(notication: Notification){
        //extraer el userinfo de la notificacion
        //let info = notication.userInfo!
        guard let info = notication.userInfo else{ return }
        //sacar la casa del userinfo
        let house = info[HOUSE_KEY] as? House!
        //actualizar modelo
        model = house!.sortedMembers
        //sincronizar vista
        self.tableView?.reloadData()
        
    }

}

// Mark: - UITableViewDataSource

extension MemberListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        
        //Descubrir la persona que tenemos que mostrar
        
        let person = model[indexPath.row]
        
        //Preguntar por una celda a un cache o crearla
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        //Sincronizar celda y persona
        
        cell?.textLabel?.text = person.fullName
        
        //Devolver la celda
        
        return cell!
    }
}

// Mark: - UITableViewDelegate

extension MemberListViewController: UITableViewDelegate{
    
}






























