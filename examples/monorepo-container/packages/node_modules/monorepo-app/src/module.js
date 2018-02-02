import * as Utils from "./utils";

const SampleModule = {
  Utils
};

export { Utils };

export default name => {
  const subModule = SampleModule[name];
  if (typeof subModule === "undefined") {
    console.trace(); //eslint-disable-line no-console
    throw Error("Invalid reference to sub-subModule ", name);
  }
  return subModule;
};
