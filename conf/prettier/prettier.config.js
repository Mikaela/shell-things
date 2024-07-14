/** @format */

// prettier.config.js, .prettierrc.js, prettier.config.mjs, or .prettierrc.mjs

/**
 * @see https://prettier.io/docs/en/configuration.html
 * @type {import("prettier").Config}
 */
const config = {
	bracketSameLine: true,
	endOfLine: "auto",
	insertPragma: true,
	overrides: [
		{
			files: ".prettierrc",
			options: {
				parser: "json",
			},
		},
	],
	plugins: [
		"@prettier/plugin-ruby",
		"@prettier/plugin-xml",
		"prettier-plugin-nginx",
		"prettier-plugin-sh",
		"prettier-plugin-toml",
	],
	proseWrap: "always",
	quoteProps: "consistent",
	requirePragma: false,
	singleAttributePerLine: true,
};

export default config;
