# CrossValidator - Demonstrates cross validation in GraphQL queries

## Requirements

This application requires a working Postgres installation running at port `5432` to run. Configuration can be changed
in the configuration files found in the `config` folder.

## Starting up the application

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` *or* `iex -S mix phx.server`

This particular implementation does not have a web front end. It only has a GraphiQL endpoint.

## GraphiQL endpoint
The GraphiQL endpoint is at [`http://localhost:4000/api/graphiql`](http://localhost:4000/api/graphiql) from your browser.

## Sample GraphiQL queries

### Assortment create
#### Mutation
```
mutation CreateAssortment($input: AssortmentInput!) {
  createAssortment(input: $input) {
    id
    uid
    specialNumberOne
    specialNumberTwo
    magicalStringOne
    magicalStringTwo
    mythicalBooleanOne
    mythicalBooleanTwo
    listOfStringsOne
    listOfStringsTwo
    fairyDateOne
    fairyDateTwo
    grabBagMapOne
    grabBagMapTwo
  }
}
```

#### Query variables
```
{
  "input": {
    "specialNumberOne": 9998,
    "specialNumberTwo": 100000,
    "magicalStringOne": "MAGIC-***",
    "magicalStringTwo": "MAGIC-####",
    "mythicalBooleanOne": true,
    "mythicalBooleanTwo": true,
    "listOfStringsOne": ["a", "list", "of", "strings"],
    "listOfStringsTwo": ["somewhat-shorter-list-of-strings"],
    "fairyDateOne": "2019-11-13",
    "fairyDateTwo": "2099-12-31",
    "grabBagMapOne": "{\"first\": 1, \"key\": \"value\" }",
    "grabBagMapTwo": "{\"a-list\": [] }"
  }
}
```

### Assortment update
#### Mutation
```
mutation UpdateAssortment($id: Int!, $input: AssortmentInput!) {
  updateAssortment(id: $id, input: $input) {
    id
    uid
    specialNumberOne
    specialNumberTwo
    magicalStringOne
    magicalStringTwo
    mythicalBooleanOne
    mythicalBooleanTwo
    listOfStringsOne
    listOfStringsTwo
    fairyDateOne
    fairyDateTwo
    grabBagMapOne
    grabBagMapTwo
  }
}
```

#### Query variables
```
{
  "id": 1,
  "input": {
    "magical_string_one": "OLD-MAGIC",
    "magical_string_two": "NEW-MAGIC"
    }
}
```

### Assortment delete
#### Mutation
```
mutation DeleteAssortment($id: Int!) {
  deleteAssortment(id: $id) {
    id
  }
}
```

#### Query variables
```
{
  "id": 1
}
```

### All Assortments
### Query
```
{
  assortments {
    nodes {
    id
    uid
    specialNumberOne
    specialNumberTwo
    magicalStringOne
    magicalStringTwo
    mythicalBooleanOne
    mythicalBooleanTwo
    listOfStringsOne
    listOfStringsTwo
    fairyDateOne
    fairyDateTwo
    grabBagMapOne
    grabBagMapTwo
  }
}
```

### Assortments by id
#### Query
```
query AssortmentById($id: Int) {
  assortment(id: $id) {
    id
    uid
    specialNumberOne
    specialNumberTwo
    magicalStringOne
    magicalStringTwo
    mythicalBooleanOne
    mythicalBooleanTwo
    listOfStringsOne
    listOfStringsTwo
    fairyDateOne
    fairyDateTwo
    grabBagMapOne
    grabBagMapTwo
  }
}
```

#### Query variables
```
{
  "id": 2
}
```

### Assortment by uuid
#### Query
```
query AssortmentByUid($uid: UUID4) {
  assortment(uid: $uid) {
    id
    uid
    specialNumberOne
    specialNumberTwo
    magicalStringOne
    magicalStringTwo
    mythicalBooleanOne
    mythicalBooleanTwo
    listOfStringsOne
    listOfStringsTwo
    fairyDateOne
    fairyDateTwo
    grabBagMapOne
    grabBagMapTwo
  }
}
```

#### Query variables
```
{
  "uid": "93e23ff4-014a-4a2d-8909-7551f4e61640"
}
```

### Assortment by mythicalBooleanOne
#### Query
```
query AssortmentsByMythicalBooleanOne($mythicalBooleanOne: Boolean) {
  assortments(mythicalBooleanOne: $mythicalBooleanOne) {
    nodes {
      id
      uid
      specialNumberOne
      specialNumberTwo
      magicalStringOne
      magicalStringTwo
      mythicalBooleanOne
      mythicalBooleanTwo
      listOfStringsOne
      listOfStringsTwo
      fairyDateOne
      fairyDateTwo
      grabBagMapOne
      grabBagMapTwo
    }
  }
}
```

#### Query variables
```
{
  "mythicalBooleanOne": true
}
```

## Some more Phoenix caveats

### Running in production?
Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html). Or...
just don't, because this is just a demo application.

### Learn more about Phoenix
  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
