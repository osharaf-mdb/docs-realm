// Models for embedded objects & dot notation queries
const Address = {
  name: "Address",
  embedded: true,
  properties: {
    name: "string",
    street: "string",
    zipcode: "int",
  },
};

const Office = {
  name: "Office",
  properties: {
    name: "string",
    address: "Address",
  },
};

// :snippet-start: rql-data-models
const Item = {
  name: "Item",
  properties: {
    _id: "objectId",
    name: { type: "string", indexed: "full-text" },
    isComplete: { type: "bool", default: false },
    assignee: "string?",
    priority: { type: "int", default: 0 },
    progressMinutes: { type: "int", default: 0 },
    projects: {
      type: "linkingObjects",
      objectType: "Project",
      property: "items",
    },
  },
  primaryKey: "_id",
};

const Project = {
  name: "Project",
  properties: {
    _id: "objectId",
    name: "string",
    items: "Item[]",
    quota: "int?",
    comments: "string?{}",
    projectLocation: "Office?",
    additionalInfo: "mixed",
  },
  primaryKey: "_id",
};
// :snippet-end:

export { Address, Item, Office, Project };