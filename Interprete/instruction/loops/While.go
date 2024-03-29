package loops

import (

	"OLC2/Interprete/interfaces"
	"OLC2/Interprete/environment"
	"OLC2/Interprete/ast"
	arrayList "github.com/colegno/arraylist"
	"reflect"
	
)

type While struct {
	Condicion 		interfaces.Expresion
	Instrucciones	*arrayList.List
}

func NewWhile(cond interfaces.Expresion, instruccion *arrayList.List) While {
	instr := While{cond, instruccion}
	return instr
}

func (p While) Interpretar(env interface{}, tree *ast.Arbol) interface{} {

	var cond interfaces.Symbol

	for true {

		cond = p.Condicion.Interpretar(env, tree)
		if cond.Tipo == interfaces.EXCEPTION {
			return nil
		}
		if cond.Tipo == interfaces.BOOLEAN {

			if cond.Valor == true {
				var newTable environment.Environment
				newTable = environment.NewEnvironment(env.(environment.Environment))

				for _, s := range p.Instrucciones.ToArray() {
					newInstr := s.(interfaces.Instruction).Interpretar(newTable, tree)

					if reflect.TypeOf(newInstr).String() == "transferencia.Break" 	 { return nil }
					if reflect.TypeOf(newInstr).String() == "transferencia.Continue" { break }
					if reflect.TypeOf(newInstr).String() == "transferencia.Return"   { return newInstr }

				}

			}else {
				break
			}

		}else {
			excep := ast.NewException("Semantico","Tipo de Dato no Booleano en While.", 1, 1)
			tree.AddException(ast.Exception{Tipo:"Semantico", Descripcion: "Tipo de Dato no Booleano en While.", Row: 1, Column: 1})
			return interfaces.Symbol{Id: "", Tipo: interfaces.EXCEPTION, Valor: excep}
		}

	}

	return nil
}