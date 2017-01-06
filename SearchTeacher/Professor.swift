//
//  Professor.swift
//  SearchTeacher
//
//  Created by Joao Paulo Lopes da Silva on 05/01/17.
//  Copyright © 2017 Joao Paulo Lopes da Silva. All rights reserved.
//

import UIKit
import Parse

class Professor: NSObject {
	
	var objectId:String?
	var nome:String!
	var imagem:UIImage?
	var curriculo:String!
	var materia:String!
	var nota:NSNumber!
	
	
	
	init(object:PFObject) {
		
		self.objectId = object.objectId
		self.nome = object["nome"] as! String
		self.curriculo = object["curriculo"] as! String
		self.materia = object["materia"] as! String
		self.nota = object["nota"] as! NSNumber
		
	
	}
	

}
