import { handler } from "./velocity-template";

async function main() {
    handler({
        version: '',
        routeKey: '',
        rawPath: '',
        rawQueryString: '',
        headers: {},
        requestContext: {
            accountId:'',
            apiId: '',
            domainName: '',
            domainPrefix: '',
            http: {
                method: '',
                path: '',
                protocol:  '',
                sourceIp:  '',
                userAgent: '',
            },
            requestId: '',
            routeKey: '',
            stage: '',
            time: '',
            timeEpoch: 0,
        },
        isBase64Encoded: false,
        body: JSON.stringify({
            "template": "{    \"version \":  \"2018-05-29 \",    \"operation \":  \"GetItem \",    \"key \": #if( $modelObjectKey ) $util.toJson($modelObjectKey) #else {    \"id \": $util.dynamodb.toDynamoDBJson($ctx.args.id) } #end }",
            "executionContext": {
                "headers": {
                    "x-api-key": "12345"
                },
                "requestAuthorizationMode": "API_KEY"
            },
            "renderContext": {
                "arguments": {},
                "source": {}
            },
            "config": {
                "schema": "type Todo {   id: ID!   name: String!   description: String   _version: Int!   _deleted: Boolean   _lastChangedAt: AWSTimestamp!   createdAt: AWSDateTime!   updatedAt: AWSDateTime! }  enum ModelSortDirection {   ASC   DESC }  type ModelTodoConnection {   items: [Todo]   nextToken: String   startedAt: AWSTimestamp }  input ModelStringInput {   ne: String   eq: String   le: String   lt: String   ge: String   gt: String   contains: String   notContains: String   between: [String]   beginsWith: String   attributeExists: Boolean   attributeType: ModelAttributeTypes   size: ModelSizeInput }  input ModelIDInput {   ne: ID   eq: ID   le: ID   lt: ID   ge: ID   gt: ID   contains: ID   notContains: ID   between: [ID]   beginsWith: ID   attributeExists: Boolean   attributeType: ModelAttributeTypes   size: ModelSizeInput }  input ModelIntInput {   ne: Int   eq: Int   le: Int   lt: Int   ge: Int   gt: Int   between: [Int]   attributeExists: Boolean   attributeType: ModelAttributeTypes }  input ModelFloatInput {   ne: Float   eq: Float   le: Float   lt: Float   ge: Float   gt: Float   between: [Float]   attributeExists: Boolean   attributeType: ModelAttributeTypes }  input ModelBooleanInput {   ne: Boolean   eq: Boolean   attributeExists: Boolean   attributeType: ModelAttributeTypes }  input ModelSizeInput {   ne: Int   eq: Int   le: Int   lt: Int   ge: Int   gt: Int   between: [Int] }  input ModelTodoFilterInput {   id: ModelIDInput   name: ModelStringInput   description: ModelStringInput   and: [ModelTodoFilterInput]   or: [ModelTodoFilterInput]   not: ModelTodoFilterInput }  enum ModelAttributeTypes {   binary   binarySet   bool   list   map   number   numberSet   string   stringSet   _null }  type Query {   syncTodos(filter: ModelTodoFilterInput, limit: Int, nextToken: String, lastSync: AWSTimestamp): ModelTodoConnection   getTodo(id: ID!): Todo   listTodos(filter: ModelTodoFilterInput, limit: Int, nextToken: String): ModelTodoConnection }  input CreateTodoInput {   id: ID   name: String!   description: String   _version: Int }  input UpdateTodoInput {   id: ID!   name: String   description: String   _version: Int }  input DeleteTodoInput {   id: ID!   _version: Int }  type Mutation {   createTodo(input: CreateTodoInput!, condition: ModelTodoConditionInput): Todo   updateTodo(input: UpdateTodoInput!, condition: ModelTodoConditionInput): Todo   deleteTodo(input: DeleteTodoInput!, condition: ModelTodoConditionInput): Todo }  input ModelTodoConditionInput {   name: ModelStringInput   description: ModelStringInput   and: [ModelTodoConditionInput]   or: [ModelTodoConditionInput]   not: ModelTodoConditionInput }  type Subscription {   onCreateTodo: Todo @aws_subscribe(mutations: [ \"createTodo \"])   onUpdateTodo: Todo @aws_subscribe(mutations: [ \"updateTodo \"])   onDeleteTodo: Todo @aws_subscribe(mutations: [ \"deleteTodo \"]) }",
                "appSync": {
                    "name": "apioidclambda",
                    "defaultAuthenticationType": {
                        "authenticationType": "API_KEY"	
                    },
                    "apiKey": "12345",
                    "additionalAuthenticationProviders": []
                }
            }
        })
    })
}

main()
