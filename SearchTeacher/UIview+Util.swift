//
//  UIview+Util.swift
//  SearchTeacher
//
//  Created by Joao Paulo Lopes da Silva on 05/01/17.
//  Copyright © 2017 Joao Paulo Lopes da Silva. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

	//MARK: Arredondar bordas de uma view até virar circulo
	func roundToCircle(){
		self.layer.cornerRadius = self.bounds.width/2
		self.layer.masksToBounds = true
	}


	//MARK: Criar bordas arrendodas em uma view
	func borderRoundCorner(value : CGFloat, colorBorder:UIColor,borderWidth:CGFloat){
		
		self.layer.borderWidth = borderWidth
		self.layer.borderColor = colorBorder.cgColor
		self.layer.cornerRadius = value
		self.clipsToBounds = true
		
	}
	
		

}
