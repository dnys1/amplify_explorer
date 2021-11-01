# Amplify Explorer

An Amplify GraphQL Transformer playground and explorer.

Live: https://dillonnys.com/explorer/

## Setup

```sh
pushd frontend/third_party/codemirror-graphql
npm install
npm run build
popd

cd frontend
dart pub global activate webdev
dart pub get
webdev serve
```