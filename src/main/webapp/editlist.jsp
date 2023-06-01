<%@ page import="java.util.*" %>
<html lang="en">

<!-- this is the jsp for editing the list -->
<head>
    <meta charset="UTF-8">
    <title>List</title>
    <jsp:include page="/meta.jsp"/>
    <jsp:include page="sidebar.jsp"/>
</head>
<body>
<div class="container">
  <h1 class="text-center mt-4 mb-5">Edit Your List Here</h1>
  <div class="row justify-content-center">
    <div class="col-md-6">
      <form method="post" action="/updatelist" enctype="application/x-www-form-urlencoded">
        <div class="form-group">
          <label for="title" class="mb-2">Title</label>
          <input type="text" class="form-control" name="title" id="title" placeholder="Enter the title" value="<%= request.getParameter("title") %>"/>
        </div>
        <div class="form-group">
          <label for="index" class="mb-2">Index</label>
          <input type="text" class="form-control" name="index" id="index" placeholder="Enter the index" value="<%= request.getParameter("content") %>"/>
        </div>
        <div class="form-group">
          <label for="items" class="mb-2">Items</label>
          <small class="text-muted d-block mb-2">Click add button to add items.</small>
          <div class="input-group mb-3">
              <input type="text" class="form-control" name="item" id="item" placeholder="Enter item">
              <button class="btn btn-outline-secondary" id="add-input-btn" type="button">Add</button>
          </div>
          <div id="input-container"></div>
          <% String[] items = request.getParameterValues("items");
          String[] listItems = items[0].split(",");
             if (listItems == null) {
                 listItems = new String[0];
             }
          %>
          <ul class="list-group mt-3" id="item-list">
            <% for (int i = 0; i < listItems.length; i++) { %>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                <%= listItems[i] %>
                <input type="hidden" name="items" value="<%= listItems[i] %>">
                <button class="btn btn-danger btn-sm remove-btn">&times;</button>
              </li>
            <% } %>
          </ul>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Save</button>
      </form>
    </div>
  </div>
</div>
<script>
    document.getElementById('add-input-btn').addEventListener('click', addItem);

  function addItem() {
    var itemInput = document.getElementById('item');
    var itemList = document.getElementById('item-list');
    var newItem = document.createElement('li');
    newItem.setAttribute('class', 'list-group-item d-flex justify-content-between align-items-center');
    newItem.innerHTML = itemInput.value + '<input type="hidden" name="item[]" value="' + itemInput.value + '">' +
      '<button class="btn btn-danger btn-sm remove-btn">&times;</button>';
    itemList.appendChild(newItem);
    itemInput.value = '';
    var removeButtons = document.getElementsByClassName('remove-btn');
    for (var i = 0; i < removeButtons.length; i++) {
      removeButtons[i].addEventListener('click', removeItem);
    }
  }
  function removeItem() {
    this.parentElement.remove();
  }
</script>
</body>
</html>
