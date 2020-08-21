data.pages.map(
	page=>page.lines.map(
		line=>{
			let newLine = line.replace(/\[(https:\/\/(?:.*?)(.jpg|.jpeg|.png|.gif))]/g, "![]($1)")
				.replace(/\[(https:\/\/gyazo.com\/(?:.*?))]/g, "![]($1.png)")      
				.replace(/\[((?:.*?))\s+(https?:\/\/[^\s]*)]/g, "[$1]($2)")
				.replace(/\[(https?:\/\/[^\s]*)\s+((?:.*?))\]/g, "[$2]($1)")
				.replace(/\[(https?:\/\/[^\s]*)\]/g, "$1");
      			if(newLine == line) {newLine = line.replace(/(\[(?:.*?)\])/g, "[$1]")}
			if(newLine == line) {newLine = line.replace(/(\[(\*+) ((?:.*?))\])/g, (match, p1, p2)=>`<font size="+${p1.length+1}">${p2}</font>`)}
      			return newLine;
    		}  
	).join("\n")
)
