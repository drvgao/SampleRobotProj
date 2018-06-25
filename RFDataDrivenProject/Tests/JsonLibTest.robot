* Settings *				
Library	 JSONLibrary			
* Test Cases *				
TestManipulatingJSON				
${json_object}=	Load JSON From File	example.json		
${object_to_add}=	Create Dictionary	country=Thailand		
${json_object}=	Add Object To Json	${json_object}	$..address	${object_to_add}
${value}=	Get Value From Json	${json_object}	$..country	
Should Be Equal As Strings	${value[0]}	Thailand	