//
//  UIColor+Util.swift
//  SearchTeacher
//
//  Created by Joao Paulo Lopes da Silva on 05/01/17.
//  Copyright © 2017 Joao Paulo Lopes da Silva. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
	
	
	
	/**
	@object: Obter uma cor apartir de um Hexadecimal color
	@param: Hexadecimal
	@return: UIColor
	*/
	func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
		return UIColor(
			red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha: CGFloat(1.0)
		)
	}
}


