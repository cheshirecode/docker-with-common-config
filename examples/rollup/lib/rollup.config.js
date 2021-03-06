import resolve from "rollup-plugin-node-resolve";
import commonjs from "rollup-plugin-commonjs";
import babel from "rollup-plugin-babel";
import filesize from "rollup-plugin-filesize";
import builtins from "rollup-plugin-node-builtins";
import pkg from "./package.json";

const plugins = [
	resolve(), // so Rollup can find imported modules
	builtins(),
	babel({
		exclude: "node_modules/**" // only transpile our source code
	}),
	commonjs(), // so Rollup can convert modules to an ES module
	filesize({
		format: {
			exponent: 0
		}
	})
];

const external = [];

export default [
	// browser-friendly UMD build
	{
		input: "src/index.js",
		output: {
			name: "index",
			file: pkg.browser,
			format: "umd"
		},
		plugins
	},

	// CommonJS (for Node) and ES module (for bundlers) build.
	// (We could have three entries in the configuration array
	// instead of two, but it's quicker to generate multiple
	// builds from a single configuration where possible, using
	// an array for the `output` option, where we can specify
	// `file` and `format` for each target)
	{
		input: "src/index.js",
		external,
		output: [
			{ file: pkg.main, format: "cjs" },
			{ file: pkg.module, format: "es" }
		],
		plugins
	}
];
