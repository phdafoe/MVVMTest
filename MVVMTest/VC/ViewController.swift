//
//  ViewController.swift
//  MVVMTest
//
//  Created by Andres on 20/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Creamos la propiedad de la vista modelo añadiendo un objeto y si enlace a el Storyboard
    @IBOutlet weak var viewModel : ViewControllerModel!
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.estimatedRowHeight = 60
        myTableView.rowHeight = UITableViewAutomaticDimension
        
        self.title = "Top peliculas"
        
        //TODO: - Registro de celda
        myTableView.register(UINib(nibName: "CusotomCell", bundle: nil), forCellReuseIdentifier: "CusotomCell")
        
        //Solicitud de datos
        viewModel.fetchMoviesFromMoviesClient {
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "CusotomCell", for: indexPath) as! CusotomCell
        configuredCell(cell, forRowAtIndexPath : indexPath)
        return cell
        
    }
    
    func configuredCell(_ cell : CusotomCell, forRowAtIndexPath indexPath: IndexPath){
        cell.mySummaryText.text = viewModel.titleForItemAtIndexPath(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

