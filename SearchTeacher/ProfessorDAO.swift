//
//  ProfessorDAO.swift
//  SearchTeacher
//
//  Created by Joao Paulo Lopes da Silva on 05/01/17.
//  Copyright © 2017 Joao Paulo Lopes da Silva. All rights reserved.
//

import UIKit
import Parse

class ProfessorDAO: NSObject {
	
	
	static func getTeachersByName(searchText:String,completionHandler completion:@escaping ( _ professores:[Professor],_ error : NSError?) -> Void){
		
		var professores:[Professor] = []
		var query:PFQuery<PFObject>!
		
		
		if (searchText.isEmpty) {
			
			query = PFQuery(className:"Professores").order(byDescending: "nota")
			
		}
		else{
			
			
			let predicate = NSPredicate(format:"nome BEGINSWITH '"+searchText.capitalized+"'")
			query = PFQuery(className: "Professores", predicate: predicate)

		}
		
		
		query.findObjectsInBackground { (professoresPF, error) in
			
			if error == nil {
    
				if let professoresPF = professoresPF {
					
					if(professoresPF.isEmpty){
						
						completion(professores,nil)
						
					}
					
					
					for professorPF in professoresPF {
						
						let professor = Professor(object: professorPF)
						
						professores.append(professor)
						
						if let imagemPF = professorPF["imagem"] as? PFFile {
							
							imagemPF.getDataInBackground(block: { (data, error) in
								
								if (error == nil){
									
									if let image = UIImage(data: data!) {
									
										professor.imagem = image
										
									    completion(professores,nil)
										
									}
									
								}
								
								
							})
							
						}
						else{
							
							completion(professores,nil)
							
						}
					}
					
				}
				else{
					
					completion(professores,nil)
					
				}
			}
			else {
    
				completion(professores, error as NSError?)
    
			}
			
		}

	}
	
	

}
