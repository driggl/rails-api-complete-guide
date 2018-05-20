user = User.create(
  { login: 'jsmith', name: 'John Smith', provider: 'github' }
)
Article.create([
  { title: 'Article title 1',
    content: 'Article content 1',
    slug: 'article-title-1',
    user: user
  },
  { title: 'Article title 2',
    content: 'Article content 2',
    slug: 'article-title-2',
    user: user
  },
  { title: 'Article title 3',
    content: 'Article content 3',
    slug: 'article-title-3',
    user: user
  }
])
