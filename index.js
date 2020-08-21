data.pages.map(
	page=>page.lines.map(
		line=>line
			.replace(/\[(https:\/\/(?:.*?)(.jpg|.jpeg|.png|.gif))]/g, "![]($1)")
			.replace(/\[(https:\/\/gyazo.com\/(?:.*?))]/g, "![]($1.png)")
			.replace(/\[((?:.*?))\ (https?:\/\/[^\s]*)]/g, "[$1]($2)")
			.replace(/\[(https?\/\/[^\s]*) ((?:.*?))\]/g, "[$2]($1)")
	)
)
