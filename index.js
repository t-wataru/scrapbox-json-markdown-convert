data.pages[0].lines.map(
	line=>line
		.replace(/\[(https:\/\/gyazo.com\/(?:.*?))]/g, "![]($1.png)")
		.replace(/\[((?:.*?))\ (https?:\/\/[^\s]*)]/g, "[$1]($2)")
		.replace(/\[(https?\/\/[^\s]*) ((?:.*?))\]/g, "[$2]($1)")
)
