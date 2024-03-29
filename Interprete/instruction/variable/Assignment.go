package variable

import (
	"OLC2/Interprete/interfaces"
	"OLC2/Interprete/environment"
	"OLC2/Interprete/ast"
	"fmt"
)


type Assignment struct {
	Id 			string
	Expresion	interfaces.Expresion
	Row			int
	Column		int
}


func NewAssignment(id string, val interfaces.Expresion, row int, column int) Assignment {
	instr := Assignment{id, val, row, column}
	return instr
}


func (p Assignment) Interpretar(env interface{}, tree *ast.Arbol) interface{} {
	/* ERROR */
	var value string = ""

	/* Buscar si el id ya existe */
	symbol := env.(environment.Environment).GetSymbol(p.Id)

	if symbol.Tipo == interfaces.NULL {
		excep := ast.NewException("Semantico", "No Existe ese Id " + p.Id , p.Row, p.Column)
		tree.AddException(ast.Exception{Tipo:"Semantico", Descripcion: "No Existe ese Id "+ p.Id, Row: p.Row, Column: p.Column})

		eTipo := excep.Tipo
		eDesc := excep.Descripcion
		
		value += fmt.Sprintf("%v", eTipo)
		value += " - "
		value += fmt.Sprintf("%v", eDesc)
		value += "\n"
		tree.AddCode(value)
		return interfaces.Symbol{Id: "", Tipo: interfaces.EXCEPTION, Valor: excep}

	}
	
	var result interfaces.Symbol
	result = p.Expresion.Interpretar(env, tree)

	if symbol.IsMut  || result.IsMut{
		result.IsMut = true
		env.(environment.Environment).SetSymbol(p.Id, result, true)
	}else {
		excep := ast.NewException("Semantico","No se puede asignar a " + p.Id + ", no es mutable.", p.Row, p.Column)
		tree.AddException(ast.Exception{Tipo:"Semantico", Descripcion: "No se puede asignar a " + p.Id + ", no es mutable.", Row: p.Row, Column: p.Column})
		eTipo := excep.Tipo
		eDesc := excep.Descripcion
		value += fmt.Sprintf("%v", eTipo)
		value += " - "
		value += fmt.Sprintf("%v", eDesc)
		value += "\n"
		tree.AddCode(value)
		return interfaces.Symbol{Id: "", Tipo: interfaces.EXCEPTION, Valor: excep}
	}
	
	
	return result.Valor

}