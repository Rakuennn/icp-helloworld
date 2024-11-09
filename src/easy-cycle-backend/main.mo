import Array "mo:base/Array";

actor {
  stable var submittedNames: [Text] = [];

  public func greet(name: Text): async Text {
    submittedNames := Array.append(submittedNames, [name]);
    return "Hello, " # name # " !";
  };
  public query func getSubmittedNames(): async [Text] {
    return submittedNames;
  };
};