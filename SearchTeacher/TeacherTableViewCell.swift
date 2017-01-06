//
//  TeacherTableViewCell.swift
//  SearchTeacher
//
//  Created by Joao Paulo Lopes da Silva on 05/01/17.
//  Copyright © 2017 Joao Paulo Lopes da Silva. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {
	
	@IBOutlet weak var imagem: UIImageView!
	@IBOutlet weak var nome: UILabel!
	@IBOutlet weak var materia: UILabel!
	@IBOutlet weak var nota: UILabel!
	@IBOutlet weak var imageBoard: UIImageView!
	
	@IBOutlet weak var collectionStar: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
		
		self.imagem.roundToCircle()
		self.imageBoard.borderRoundCorner(value:imageBoard.frame.height/5, colorBorder: UIColor().UIColorFromRGB(0x000000), borderWidth: 1.0)
		
		

    }
	
	func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
		
		collectionStar.delegate = dataSourceDelegate
		collectionStar.dataSource = dataSourceDelegate
		collectionStar.tag = row
		collectionStar.reloadData()
		
	}

	

}
