export const createGUID = () => {
  return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function(c) {
    const r = (Math.random() * 16) | 0;
    const v = c === "x" ? r : (r & 0x3) | 0x8;
    return v.toString(16);
  });
};

export const formatStringToNumber = (n, dec) => {
  let result = 0;
  if (!isNaN(n)) {
    result = parseFloat(n.toString().replace(/,/g, ""));
    if (dec) {
      result = result.toFixed(dec);
    }
    result = Number.isNaN(result) ? 0 : +result;
  }
  return result;
};
