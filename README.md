Sample rails app for https://github.com/rmosolgo/graphql-ruby/issues/4075

## How to setup

```sh
bundle install
bin/rails db:migrate
bin/rails db:seed
```

## Sample query

```sh
# Start server
bin/rails server

# Open http://localhost:3000/graphql_playground
```

```gql
# without dataloader
{
  users {
    name
    blogs {
      title
      comments {
        body
      }
    }
  }
}
```

```gql
# with dataloader
{
  users {
    name
    blogDataloader {
      title
      commentsDataloader {
        body
      }
    }
  }
}

# and order
{
  users {
    name
    blogDataloader(order: DESC) {
      title
    }
  }
}
```

```gql
# without dataloader, with connection
{
  users {
    name
    blogsConnection {
      nodes {
        title
      }
    }
  }
}

# and order
{
  users {
    name
    blogsConnection(order: DESC) {
      nodes {
        title
      }
    }
  }
}
```

```gql
# with dataloader, with connection
{
  users {
    name
    blogsConnectionDataloader {
      nodes {
        title
      }
    }
  }
}

# and order
{
  users {
    name
    blogsConnectionDataloader(order: DESC) {
      nodes {
        title
      }
    }
  }
}
```
