import pegged.grammar;
import std.stdio;


void main()
{

}

mixin(grammar(`
Arithmetic:
    Term     < Factor (Add / Sub)*
    Add      < "+" Factor
    Sub      < "-" Factor
    Factor   < Primary (Mul / Div)*
    Mul      < "*" Primary
    Div      < "/" Primary
    Primary  < Parens / Neg / Pos / Number / Variable
    Parens   < "(" Term ")"
    Neg      < "-" Primary
    Pos      < "+" Primary
    Number   < ~([0-9]+)

    Variable <- identifier
`));

unittest {
	// Test pegged
	// Parsing at compile-time:
    enum parseTree1 = Arithmetic("1 + 2 - (3*x-5)*6");

    pragma(msg, parseTree1.matches);
    assert(parseTree1.matches == ["1", "+", "2", "-",
       "(", "3", "*", "x", "-", "5", ")", "*", "6"]);

    // And at runtime too:
    const auto parseTree2 = Arithmetic(" 0 + 123 - 456 ");
    assert(parseTree2.matches == ["0", "+", "123", "-", "456"]);
}
unittest {
	// And at runtime too:
    const auto parseTree = Arithmetic("1 + 2 - (3*x-5)*6");
    // assert(parseTree.matches == ["0", "+", "123", "-", "456"]);
	// parseTree.name.writeln;
	// parseTree.children.each!(node=>node.matches[1].writeln);

	string treeToPolishNotation(ParseTree tree) {
		switch(tree.name){
			case "Arithmetic.Term":
				return "";
			case "Arithmetic.Add":
				return "";
			case "Arithmetic.Sub":
				return "";
			case "Arithmetic.Factor":
				return "";
			case "Arithmetic.Mul":
				return "";
			case "Arithmetic.Div":
				return "";
			case "Arithmetic.Primary":
				return "";
			case "Arithmetic.Parens":
				return "";
			case "Arithmetic.Neg":
				return "";
			case "Arithmetic.Pos":
				return "";
			case "Arithmetic.Number":
				return "";
			default:
				return "";
		}
	}
}


import std.algorithm, std.stdio, std.string, std.json;




/+++
Scrapboxのページクラス
++++/
class Page {
	///ページタイトル
	string title;
	///行
	string lines;
}

mixin(grammar(`
ScrapboxMd:
    Line     < .*
`));
unittest {
	const auto s = "./sample/t-Impression_20200802_222421.json".File.byLine.join;
	const JSONValue scrapboxJson = parseJSON(s);
	const auto pages = scrapboxJson["pages"];
	pages.type.writeln;

	string line = pages[0]["lines"].array.map!(line=>line.str)[0];
	line.writeln;
	line.ScrapboxMd.matches.join("").writeln;
	
	// ScrapboxMd(line).writeln;
	// pages.array.map!(page=>page["lines"]).writeln;
}