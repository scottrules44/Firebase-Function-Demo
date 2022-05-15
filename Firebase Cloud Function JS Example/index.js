const functions = require("firebase-functions");

exports.addOne = functions.https.onCall((data, context) => {
  var value = data.value;
  return {newValue:value+1};
});
