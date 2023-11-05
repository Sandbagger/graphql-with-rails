# README

type: #atom
link: https://devot.team/blog/how-to-create-a-graphql-api-with-ruby-on-rails
topics: [[Rails]] [[GraphQL]]

This is is me following along with the above tutorial for graphql-ruby. I noodled around with adding testing and making notes as I go.

Note: Rails 7 uses import maps by default whereas the tutorial assumes the use of Sprockets.

- add sprockets-rails to gem
- add manifest file to app/assets/config/manifest.js

## Schema Language

Used to describe data that can be read and mutated

### Object Type

Layer of abstraction that wraps modal instance, declaring fields that interface with the modal attributes, declaring a type for each field, and optionally a description that can be surfaced in documentation.

We can declare additonal fields that are not backed by a modal attribute.

You can also wrap plain old Ruby objects (POROs).

Think of them as a resource.

### Query Type

Define 'entry point' for each query, which is a fancy way of saying that it maps a query to an object type and a method that is actually responsible for fetching the data.

It (kind of) replaces controller layer in the MVC pattern.

## Testing

The tutorial didn't cover testing. In order to set up testing I had to declare a schema in the graphql folder...

```
class Schema < GraphQL::Schema
  query Types::QueryType
end
```

### Integration Testing Queries

Uses multiline string to declare a query

```
query name
    object (resource)
        fields
```

i.e...

```
    query_string = <<-GRAPHQL
            query AuthorName($id: ID!) {
                author(id: $id) {
                 id
                name
            }
        }
    GRAPHQL
```

## Todo

- How can I mock the database for faster testing? I think I would need to stub Author.find found in the query type.
