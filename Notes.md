<form action="/articles/<%= @article.id %>" method="post">
      <p>
      	<h1>
      		<label for "title">Article Title:</label>
      		<input type="text" name="title" id="title" value="<%= @Article.title %>">
        </h1>
      </p>
     
      <p>
      	<h3>
      		<label for "content">Article Content:</label>
      		<input type="text" name="content" id="content" value="<%= @Article.content %>">
        </h3>
      </p>
    
      <p>
      	<h3>
          	<input type="submit" id="submit" value="Submit">
      		<input id="hidden" type="hidden" name="_method" value="patch">
        </h3>
      </p>
    </form>