//
//  ViewController.swift
//  SearchTeacher
//
//  Created by Joao Paulo Lopes da Silva on 05/01/17.
//  Copyright © 2017 Joao Paulo Lopes da Silva. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
	
	@IBOutlet weak var searchBar: UISearchBar!
	
	@IBOutlet weak var tableTeacher: UITableView!
	
	@IBOutlet weak var loading: UIActivityIndicatorView!
	
	var professores:[Professor] = []
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableTeacher.isHidden = true
		self.loading.isHidden = false
		self.loading.startAnimating()
		
		self.list()
		
	}
	
	func list() {
		
		ProfessorDAO.getTeachersByName(searchText: self.searchBar.text!, completionHandler: { (professoresList, error) in
			
			if (error == nil){
				
				self.professores = professoresList
				self.tableTeacher.isHidden = false
				self.loading.isHidden = true
				self.loading.stopAnimating()
				self.tableTeacher.reloadData()
				
			}
			

		})
		
	}

}

extension ListViewController:UITableViewDelegate,UITableViewDataSource{
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return self.professores.count
		
		
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellProf", for: indexPath) as! TeacherTableViewCell
		
		
		cell.imagem.image =  self.professores[indexPath.row].imagem
		cell.nome.text = self.professores[indexPath.row].nome
		cell.materia.text = self.professores[indexPath.row].materia
		cell.nota.text = self.professores[indexPath.row].nota.stringValue
		
		
		cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
		
		return cell
		
		
	}
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let alertController = UIAlertController(title: "Curriculo: "+self.professores[indexPath.row].nome,
		                                        message: self.professores[indexPath.row].curriculo,
		                                        preferredStyle: .alert)
		
		let defaultAction = UIAlertAction(title: "Ok",
		                                  style: .default, handler: nil)
		alertController.addAction(defaultAction)
		
		present(alertController, animated: true, completion: nil)
		
		
		
		
	}
	
	
	
}

extension ListViewController:UICollectionViewDelegate,UICollectionViewDataSource{
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		let round = self.professores[collectionView.tag].nota as Double
		
		return Int(round.roundTo(places: 0))
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellStar", for: indexPath) as! StarCollectionViewCell
		
		
		
		return cell
	}
	
	
	
}


extension ListViewController:UISearchBarDelegate,UISearchDisplayDelegate{
	
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		
		self.list()
		
		
	}
	
	
	
	
}


