const assert = require("assert");
const SampleModule = require("..");
const subModuleFetch = SampleModule["default"];

function test(name, condition) {
	assert.equal(
		typeof condition == "function" ? condition() : !!condition,
		true
	);
	console.log(`\u001B[32m✓\u001B[39m ${name}`); //eslint-disable-line no-console
}

test(
	"Fetch dynamic sub-module",
	typeof subModuleFetch === "function" &&
		typeof subModuleFetch("Utils") !== "undefined"
);
test("Utils exists", typeof SampleModule.Utils !== "undefined");
test(
	"Utils.createGUID exists",
	typeof SampleModule.Utils.createGUID !== "undefined"
);
