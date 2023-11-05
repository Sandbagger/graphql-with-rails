class QueryTypeTest < Minitest::Test
  def setup
    @schema = Schema
  end

  def test_author_query
    author = Author.create(name: "John Doe")

    query_string = <<-GRAPHQL
            query AuthorName($id: ID!) {
                author(id: $id) {
                 id
                name
            }
        }
    GRAPHQL

    result = @schema.execute(query_string, variables: {id: author.id})

    assert_equal author.id, result["data"]["author"]["id"].to_i
    assert_equal author.name, result["data"]["author"]["name"]
  end
end
